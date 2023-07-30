# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      <home-manager/nixos>
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  programs.fish.enable = true;
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.georgian = {
    isNormalUser = true;
    description = "Georgian Camarasan";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [ 
    ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "georgian";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      firefox
      home-manager
      openssl
      nfs-utils
      fish
      (import (fetchTarball https://github.com/cachix/devenv/archive/v0.6.3.tar.gz)).default
      git
      lua51Packages.lua
      lua51Packages.luarocks
      cmake
      gcc13
      gnumake
      pkg-config
      libtool
      unzip
      gettext
      curl
      nodejs_20
      nodePackages.eslint
      nodePackages.typescript-language-server
      nodePackages.typescript
      nodePackages.ts-node
      nodePackages.neovim
      stow
      ncdu
      tree
      xclip
      python311
      python311Packages.pip
      python311Packages.pynvim
      python311Packages.black
      python311Packages.flake8
      python311Packages.ansible-core
      tidyp
      rustup
      wget
      fzf
      fishPlugins.fzf
      direnv
      nixos-option
      xorg.libxcb
      ntfs3g
  ];
  environment.shells = with pkgs; [ fish ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  services.logind.extraConfig = "RuntimeDirectorySize=2G";

  # Make sure opengl is enabled
  # hardware.opengl = {
    # enable = true;
    # driSupport = true;
    # driSupport32Bit = true;
  # };

  # NVIDIA drivers are unfree.
  # nixpkgs.config.allowUnfreePredicate = pkg:
  #  builtins.elem (lib.getName pkg) [
  #    "nvidia-x11"
  #    "nvidia-settings"
  #  ];

  # Tell Xorg to use the nvidia driver
  services.xserver.videoDrivers = ["nvidia"];

  # hardware.nvidia = {

    # Modesetting is needed for most wayland compositors
    # modesetting.enable = true;

    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    # open = true;

    # Enable the nvidia settings menu
    # nvidiaSettings = true;

    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    # package = config.boot.kernelPackages.nvidiaPackages.latest;
  # };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "DejaVuSansMono" ]; })
  ];

  services.rpcbind.enable = true;
  systemd.mounts = let commonMountOptions = {
    type = "nfs";
    mountConfig = {
      Options = "noatime";
    };
  };
  in
  [
    (commonMountOptions // {
      what = "nfs.server.rsp:/volume1/video";
      where = "/mnt/video";
    })

    (commonMountOptions // {
      what = "nfs.server.rsp:/volume1/nfs";
      where = "/mnt/nfs";
    })
  ];

  systemd.automounts = let commonAutoMountOptions = {
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
  };

  in

  [
    (commonAutoMountOptions // { where = "/mnt/video"; })
    (commonAutoMountOptions // { where = "/mnt/nfs"; })
  ];

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-run"
  ];

}
