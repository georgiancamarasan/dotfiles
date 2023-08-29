{ config, pkgs, lib, ...}:
{
  nixpkgs.config.allowUnfree = true;

  home.username = "georgian";
  home.homeDirectory = "/home/georgian";

  home.stateVersion = "23.05";
  programs.home-manager.enable = true;

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
    lazygit
  ];

  programs.git = {
    enable = true;
    userName = "Georgian Camarasan";
    userEmail = "georgian.camarasan@zohomail.eu";
  };

  programs.mpv = {
    enable = true;
    scripts = with pkgs; [
      mpvScripts.autoload
      mpvScripts.uosc
      mpvScripts.inhibit-gnome
      mpvScripts.mpv-playlistmanager
    ];
  };

  programs.alacritty = {
    enable = true;
  };
}
