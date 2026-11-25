#!/usr/bin/env bash
# Prepare a fresh machine and run the playbook.
#   ./bootstrap.sh           desktop (Ubuntu)
#   ./bootstrap.sh server    Ubuntu server, provisioning itself
set -euo pipefail

cd "$(dirname "$0")"
target="${1:-desktop}"

. /etc/os-release
case "${ID_LIKE:-$ID}" in
  *debian*|*ubuntu*)
    # The distro ansible is used on every release (the PPA lags behind
    # non-LTS releases); it is new enough for the collections in requirements.yml.
    sudo apt-get update
    sudo apt-get install -y ansible git make rsync
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
