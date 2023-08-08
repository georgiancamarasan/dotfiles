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

  networking = {
  	hostName = "nixos"; # Define your hostname.
	  # wireless.enable = true;  # Enables wireless support via wpa_supplicant.

	  # Configure network proxy if necessary
	  # proxy.default = "http://user:password@proxy:port/";
	  # proxy.noProxy = "127.0.0.1,localhost,internal.domain";

	  # Enable networking
	  networkmanager.enable = true;

	  # Open ports in the firewall.
	  # firewall = {
		  # allowedTCPPorts = [ ... ];
		  # allowedUDPPorts = [ ... ];
		  # Or disable the firewall altogether.
		  # enable = false;
	  # };
  };

  # Set your time zone.
  time.timeZone = "Europe/Bucharest";

  # Select internationalisation properties.
  i18n = {
	defaultLocale = "en_US.UTF-8";

  	extraLocaleSettings = {
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
  };

  services = {
	  # Enable the X11 windowing system.
	  xserver.enable = true;

	  # Enable the GNOME Desktop Environment.
	  xserver.displayManager.gdm.enable = true;
	  xserver.desktopManager.gnome.enable = true;

	  # Configure keymap in X11
	  xserver = {
	    layout = "us";
	    xkbVariant = "";
	  };

	  # Enable CUPS to print documents.
	  printing.enable = true;

	  # Enable sound with pipewire.
	  pipewire = {
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
	  # xserver.libinput.enable = true;

	  # Enable automatic login for the user.
	  xserver.displayManager.autoLogin.enable = true;
	  xserver.displayManager.autoLogin.user = "georgian";

	  # Enable the OpenSSH daemon.
	  openssh.enable = true;
	  logind.extraConfig = "RuntimeDirectorySize=2G";

	  # Tell Xorg to use the nvidia driver
	  xserver.videoDrivers = ["nvidia"];

	  rpcbind.enable = true;
  };

  sound.enable = true;
  hardware = {
	  pulseaudio.enable = false;
	  # Make sure opengl is enabled
	  # opengl = {
	    # enable = true;
	    # driSupport = true;
	    # driSupport32Bit = true;
	  # };
	  # nvidia = {

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

  };
  security.rtkit.enable = true;

  programs = {
	  fish.enable = true;
	  # Some programs need SUID wrappers, can be configured further or are
	  # started in user sessions.
	  # mtr.enable = true;
	  # gnupg.agent = {
	  #   enable = true;
	  #   enableSSHSupport = true;
	  # };

	  steam = {
	    enable = true;
	    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
	    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
	  };
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.georgian = {
    isNormalUser = true;
    description = "Georgian Camarasan";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    shell = pkgs.fish;
    packages = with pkgs; [
      lutris
      firefox
      home-manager
      rustup
    ];
  };

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpkgs/issues/103746#issuecomment-945091229
  systemd = {
	  services = {
		  "getty@tty1".enable = false;
		  "autovt@tty1".enable = false;
	  };
	  mounts = let commonMountOptions = {
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
	  automounts = let commonAutoMountOptions = {
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

	  extraConfig = "DefaultTimeoutStopSec=10s";
  };

  # Allow unfree packages
  nixpkgs = {
	  config = {
		  allowUnfree = true;
		  # NVIDIA drivers are unfree.
		  # allowUnfreePredicate = pkg:
		  #  builtins.elem (lib.getName pkg) [
		  #    "nvidia-x11"
		  #    "nvidia-settings"
		  #  ];
		  allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
		    "steam"
		    "steam-original"
		    "steam-run"
		  ];
	  };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
      # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
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
      wget
      fzf
      fishPlugins.fzf
      direnv
      nixos-option
      xorg.libxcb
      ntfs3g
  ];
  environment.shells = with pkgs; [ fish ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "DejaVuSansMono" ]; })
  ];

  virtualisation.docker = {
  	# enable = true;
	storageDriver = "btrfs";
	rootless = {
		enable = true;
		setSocketVariable = true;
	};
  };
}
