{ config, pkgs, lib, ...}:
{
  home.username = "georgian";
  home.homeDirectory = "/home/georgian";

  home.stateVersion = "24.05";
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Georgian Camarasan";
      userEmail = "georgian.camarasan@zohomail.eu";
    };

    lazygit = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    htop
    tmux
    tldr
    taskwarrior
    timewarrior
    mc
    wasmtime
    file
    just
    bat
    diskonaut
    fd
    ripgrep
    rm-improved
    stylua
    xsv
    zoxide
    lsd
    pueue
    fishPlugins.pure
    gh
    python311
    python311Packages.pip
    python311Packages.pynvim
    python311Packages.black
    python311Packages.flake8
    python311Packages.ansible-core
    python311Packages.mkdocs
    nodejs_20
    nodePackages.eslint
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.ts-node
    nodePackages.neovim
    nodePackages.pyright
    ncdu
    rust-analyzer
    lua-language-server
    tree-sitter
    watchexec
    yarn
    uair
    taplo
    tokei
    kubectl
    kind
    fish
    neovim
    stow
    ansible
    git
    rustup
    nfs-utils
    lua51Packages.lua
    lua51Packages.luarocks
    cmake
    gcc13
    libstdcxx5
    gnumake
    pkg-config
    libtool
    unzip
    gettext
    curl
    tree
    tidyp
    wget
    fzf
    fishPlugins.fzf
    direnv
  ];

  home.file = {

  };

  home.sessionVariables = {

  };
}
