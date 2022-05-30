function install_cargo_apps
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

  cargo install pueue

  systemctl --user daemon-reload
  systemctl --user enable --now pueued

  pueue add cargo binstall exa
  pueue add cargo install bat
  pueue add cargo install cargo-update
  pueue add cargo install cargo-binstall
  pueue add cargo install diskonaut
  pueue add cargo install fd-find
  pueue add cargo install just
  pueue add cargo install ripgrep
  pueue add cargo install rm-improved
  pueue add cargo install xsv
  pueue add cargo install zoxide

end
