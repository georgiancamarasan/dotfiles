# dotfiles

Ansible provisions the machine (packages, tools, SSH key) and GNU Stow symlinks
the config folders under `stow/` into `$HOME`.

- **Desktop**: Manjaro, run locally.
- **Servers**: Ubuntu, run over SSH from the desktop *or* locally on the server.

## Quick start

```sh
./bootstrap.sh            # fresh Manjaro desktop: installs ansible, collections, runs everything
./bootstrap.sh server     # on an Ubuntu server with this repo cloned
```

Day to day:

| Command | What it does |
|---|---|
| `make deps` | install the Ansible collections from `requirements.yml` |
| `make desktop` | full run on this machine (asks for your sudo password) |
| `make desktop TAGS=nodejs,rust` | only those roles |
| `make check` | dry run, shows what would change |
| `make servers` | run against the hosts in `inventory/hosts.yml` → `servers` |
| `make server-local` | run on the server this repo is cloned on |

Tags: `packages`, `system_packages`, `aur`, `dotfiles`/`stow`, `rust`, `nodejs`,
`python_tools`, `neovim`, `ssh`, `systemd_system`, `systemd_user`/`systemd`.

## Layout

```
site.yml                  playbook: "all" play + "desktop only" play
inventory/hosts.yml       machines (desktop = localhost, servers = your Ubuntu boxes)
inventory/local_server.yml  inventory used when a server provisions itself
inventory/group_vars/
  all/main.yml            shared settings, native package lists, stow packages
  all/tools.yml           npm / cargo / uv tool lists
  desktop.yml             desktop overrides (AUR, systemd units, SSH private key)
  servers.yml             server overrides (lighter setup)
roles/<name>/             one role per concern (tasks/, defaults/, meta/)
files/                    unit files copied to /etc/systemd/system (systemd_system role)
stow/<app>/               config for one app, laid out exactly as in $HOME
```

**Where do I change things?** Almost always in `inventory/group_vars/`. Role
`defaults/main.yml` files only hold fallbacks; group_vars override them.
Shared lists (packages, stow packages, tools) live in `all/`; `desktop.yml` and
`servers.yml` add to them through `<name>_extra` (e.g. `stow_packages_extra`,
`packages_arch_extra`) instead of redefining the whole list.

## Adding things

- **Native package**: add to `packages_common` (same name on both distros), or
  `packages_arch` / `packages_debian`.
- **AUR package**: `aur_packages` in `desktop.yml`.
- **npm / Rust / Python tool**: `npm_packages`, `cargo_packages`, `uv_tools` in `all/tools.yml`
  (or override the list in `desktop.yml` / `servers.yml`).
- **Config for a new app**: create `stow/<app>/` mirroring the path in `$HOME`,
  e.g. `stow/git/.config/git/config`, then add `- name: git` to `stow_packages`
  (or `stow_packages_extra` in `desktop.yml` / `servers.yml` for one group only).
- **systemd user unit**: put it in `stow/systemd/.config/systemd/user/` and list
  it in `systemd_user_units` in `desktop.yml`.
- **systemd system unit** (e.g. NFS mounts, needs root): put it in
  `files/` and list it in `systemd_system_units` in `desktop.yml`.

- **Shell alias** (bash and zsh): add `name: command` to `shell_aliases` in `all/main.yml`,
  then `make desktop TAGS=shell_aliases`.
- **Folder in /mnt**: add its name to `mnt_dirs`, then `make desktop TAGS=mnt_dirs`.

### Stow notes

- Stow fails if a real file already exists where it wants to put a link. Move
  the existing file away (or run `stow --adopt` manually to pull it into the
  repo, then review with `git diff`).
- `no_folding: true` (used for `systemd`) makes stow link individual files
  instead of whole directories, so `systemctl --user enable` doesn't write its
  symlinks into this repo.
- nvim is stowed as a directory link, so `lazy-lock.json` ends up in the repo:
  commit it to pin plugin versions (servers then restore the same versions).

## SSH key & Ansible Vault

See `roles/ssh/files/README.md`. In short:

```sh
cp ~/.ssh/id_ed25519{,.pub} roles/ssh/files/
make vault-encrypt-key
```

The vault password is only needed to decrypt the private key, which is
installed only when `~/.ssh/id_ed25519` doesn't exist yet. So `make desktop`
asks for it on the first run only; later runs (and all server runs) don't.

- Rotated the key? Replace the file in the repo, encrypt it, then `make ssh-key`
  (asks for the password and overwrites `~/.ssh/id_ed25519`).
- Want no prompt at all? Store the password outside the repo and
  `export VAULT_PASS_FILE=~/.config/ansible/vault-pass` (chmod 600).

## Shell setup (add to your zshrc)

The installers are run with "don't modify my shell" flags, so add:

```sh
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/share/fnm:$PATH"
eval "$(fnm env --use-on-cd --shell zsh)"
```
