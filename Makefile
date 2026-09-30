# Convenience wrappers around ansible-playbook.
#   make desktop                 full run on this machine
#   make desktop TAGS=nodejs     only some roles (comma separated)
#   make servers ARGS="-l web1"  extra ansible-playbook args
#   make ssh-key                 (re)install the SSH key from the vault
#   VAULT_PASS_FILE=~/.config/ansible/vault-pass make desktop

PLAYBOOK := ansible-playbook site.yml
TAGS ?=
ARGS ?=

SSH_KEY_NAME ?= id_ed25519

TAG_ARG := $(if $(TAGS),--tags $(TAGS),)

# The vault is only needed to decrypt the SSH private key, which the ssh role
# installs only when ~/.ssh/$(SSH_KEY_NAME) is missing. So ask for the vault
# password only if the key is in the repo (encrypted) and not yet installed.
KEY_ENCRYPTED := $(shell grep -qs '^\$$ANSIBLE_VAULT' roles/ssh/files/$(SSH_KEY_NAME) && echo yes)
KEY_INSTALLED := $(wildcard $(HOME)/.ssh/$(SSH_KEY_NAME))
NEED_VAULT := $(and $(KEY_ENCRYPTED),$(if $(KEY_INSTALLED),,yes))
ASK_VAULT := $(if $(VAULT_PASS_FILE),--vault-password-file $(VAULT_PASS_FILE),--ask-vault-pass)
VAULT_ARG := $(if $(or $(NEED_VAULT),$(VAULT_PASS_FILE)),$(ASK_VAULT),)

BASE := $(PLAYBOOK) --ask-become-pass $(TAG_ARG) $(ARGS)

.PHONY: deps desktop servers server-local check ssh-key syntax lint vault-encrypt-key vault-edit-key

deps: ## Install required Ansible collections
	ansible-galaxy collection install -r requirements.yml

desktop: ## Provision this desktop
	$(BASE) $(VAULT_ARG) --limit desktop

# Servers never receive the private key, so no vault password is needed.
servers: ## Provision servers over SSH
	$(BASE) --limit servers

server-local: ## Provision the server this repo is cloned on
	$(BASE) -i inventory/local_server.yml

check: ## Dry run on the desktop, showing diffs
	$(BASE) $(VAULT_ARG) --limit desktop --check --diff

ssh-key: ## Install/overwrite the SSH key from the vault (e.g. after rotating it)
	$(PLAYBOOK) --limit desktop --tags ssh $(ASK_VAULT) -e ssh_update_private_key=true $(ARGS)

syntax:
	$(PLAYBOOK) --syntax-check

lint:
	ansible-lint

vault-encrypt-key:
	ansible-vault encrypt roles/ssh/files/id_ed25519

vault-edit-key:
	ansible-vault edit roles/ssh/files/id_ed25519
