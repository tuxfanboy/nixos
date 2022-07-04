########################################################################
#								       #
#       ____             _       _       _   _ _       ___  ____       #
#      / ___| __ ___   _(_)_ __ ( )___  | \ | (_)_  __/ _ \/ ___|      #
#     | |  _ / _` \ \ / / | '_ \|// __| |  \| | \ \/ / | | \___ \      #
#     | |_| | (_| |\ V /| | | | | \__ \ | |\  | |>  <| |_| |___) |     #
#      \____|\__,_| \_/ |_|_| |_| |___/ |_| \_|_/_/\_\\___/|____/      #
# 								       #
#                     ____             __ _			       #
#                    / ___|___  _ __  / _(_) __ _		       #
#                   | |   / _ \| '_ \| |_| |/ _` |                     #
#                   | |__| (_) | | | |  _| | (_| |	               #
#                    \____\___/|_| |_|_| |_|\__, |                     #
#                                           |___/		       #
#								       #
########################################################################
# Edit this configuration file to define what should be installed on   #
# your system.  Help is available in the configuration.nix(5) man page #
# and in the NixOS manual (accessible by running ‘nixos-help’).        #
########################################################################

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  # Use either "auto" or "max"
  boot.loader.systemd-boot.consoleMode = "max";
  boot.loader.efi.canTouchEfiVariables = true;

  # Newer Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  networking.hostName = "nix"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.
  networking.wireless.iwd.enable = false;

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkbOptions in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.videoDrivers = [ "nvidia"];

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;
  # OpenGL
  hardware.opengl.enable = true;
  # NVIDIA Modesetting
  hardware.nvidia.modesetting.enable = false;
  # Bluetooth
  hardware.bluetooth.enable = false;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = false;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gavin = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo/doas’ for the user.
  };

  # Switching out Sudo for Doas
  security.sudo.enable = false;
  security.doas.enable = true;
  security.doas.extraRules = [{
      users = [ "gavin" ];
      keepEnv = true;
      persist = true;
  }];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    htop
    neofetch
    # wm/gui
    bspwm
    sxhkd
    polybar
    pavucontrol
    firefox
    feh
    vlc
    picom
    alacritty
    dmenu
    # Gaming
    discord
    polymc
    jdk
    # screenshot utils
    scrot
    maim
    xclip
  ];

  # Fonts
  fonts.fonts = with pkgs; [
    jetbrains-mono
  ];
  
  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = false;
  services.sshd.enable = false;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?

}

