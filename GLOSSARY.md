# Dotfiles

Provisioning for the machines this repo manages: what gets installed on them and which config gets linked into `$HOME`.

## Machines

**Desktop**:
The personal Ubuntu workstation, provisioned by running the playbook on the machine itself.
_Avoid_: Manjaro box, workstation, localhost

**Server**:
An Ubuntu machine that gets a lighter setup than the Desktop, provisioned over SSH from the Desktop or by running the playbook on the server itself.
_Avoid_: Host, remote, box
