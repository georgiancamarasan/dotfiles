#!/usr/bin/env bash
# Prepare a fresh machine and run the playbook.
#   ./bootstrap.sh           desktop (Manjaro)
#   ./bootstrap.sh server    Ubuntu server, provisioning itself
set -euo pipefail

cd "$(dirname "$0")"
target="${1:-desktop}"

. /etc/os-release
case "${ID_LIKE:-$ID}" in
  *arch*)
    sudo pacman -Syu --needed --noconfirm ansible git make rsync
    ;;
  *debian*|*ubuntu*)
    # Distro ansible is too old for current collections; use the official PPA.
    sudo apt-get update
    sudo apt-get install -y software-properties-common git make rsync
    sudo add-apt-repository -y --update ppa:ansible/ansible
    sudo apt-get install -y ansible
    ;;
  *)
    echo "Unsupported distribution: $ID" >&2
    exit 1
    ;;
esac

make deps

case "$target" in
  desktop) make desktop ;;
  server)  make server-local ;;
  *) echo "Usage: $0 [desktop|server]" >&2; exit 1 ;;
esac
