{ config, pkgs, lib, ...}:
{
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-24.8.6"
    ];
  };

  home.username = "georgian";
  home.homeDirectory = "/home/georgian";

  home.stateVersion = "23.05";
  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "Georgian Camarasan";
      userEmail = "georgian.camarasan@zohomail.eu";
    };
    mpv = {
      enable = true;
      scripts = with pkgs; [
        mpvScripts.autoload
        mpvScripts.uosc
        mpvScripts.inhibit-gnome
        mpvScripts.mpv-playlistmanager
      ];
    };
    alacritty = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  home.packages = with pkgs; [
    bitwarden
    keepassxc
    htop
    tmux
    tldr
    taskwarrior
    timewarrior
    thunderbird
    skypeforlinux
    teams-for-linux
    lutris
    wineWowPackages.full
    qbittorrent
    brave
    kodi
    nextcloud-client
    pavucontrol
    calibre
    mc
    qpdfview
    synology-drive-client
    wasmtime
    xarchiver
    file
    trilium-desktop
    joplin-desktop
    freeplane
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
    xclip
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
    libreoffice
    uair
    taplo
    tokei
  ];
}
