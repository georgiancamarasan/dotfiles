{ config, pkgs, lib, ...}:
{
  nixpkgs.config.allowUnfree = true;

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

  home.packages = with pkgs; [
    bitwarden
    keepassxc
    htop
    tmux
    tldr
    taskwarrior
    thunderbird
    skypeforlinux
    teams-for-linux
    lutris
    wineWowPackages.full
    rtorrent
    pyrosimple
    qbittorrent
    brave
    kodi
    nextcloud-client
    pavucontrol
    calibre
    mc
    mupdf
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
    lsd
    fd
    ripgrep
    rm-improved
    stylua
    xsv
    zellij
    zoxide
    pueue
    fishPlugins.pure
  ];
}
