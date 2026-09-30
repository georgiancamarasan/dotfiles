# SSH key

Put your key pair here, named after `ssh_key_name` (default `id_ed25519`):

```sh
cp ~/path/to/id_ed25519 ~/path/to/id_ed25519.pub roles/ssh/files/
ansible-vault encrypt roles/ssh/files/id_ed25519   # or: make vault-encrypt-key
```

- Only the **private** key is encrypted; the `.pub` file stays plain text.
- The playbook refuses to run if the private key is not encrypted.
- To view/change it later: `ansible-vault view|edit roles/ssh/files/id_ed25519`.
- Until the files exist, the ssh role just prints a message and skips.
