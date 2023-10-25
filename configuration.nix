{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  nix.settings.allowed-users = [ "@wheel" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.device = "/dev/nvme0n1";

  networking.hostName = "gloss"; # Define your hostname.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "America/Regina";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  fonts.fontconfig.defaultFonts = {     
    monospace = [       
      "Hermit"       
      "IPAGothic"
    ];
    sansSerif = [
      "DejaVu Sans"
      "IPAPGothic"
    ];
    serif = [
      "DejaVu Serif"
      "IPAPMincho"
    ];   
  };

  environment.pathsToLink = ["/libexec"];

  services.xserver.layout = "us";
  services.xserver.xkbOptions = "eurosign:e,caps:escape";
  services.xserver = {
    enable = true;
    desktopManager = {
      xterm.enable = false;
    };
    displayManager = {
      defaultSession = "none+i3";
      startx.enable = true;
      setupCommands = "${pkgs.xorg.xrandr}/bin/xrandr --rate 144.00";
    };
    windowManager.i3.package = pkgs.i3-gaps;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3lock
        i3blocks
      ];
    };
  };

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  users.users.rf = {
    isNormalUser = true;
    initialPassword = "Password";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      firefox
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    emacs
    wget
    git
  ];

  system.stateVersion = "23.05";
}

