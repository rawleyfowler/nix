{ config, pkgs, ... }:

{
  imports =
    [ ./alacritty.nix
    ];
  home.username = "rf";
  home.homeDirectory = "/home/rf";

  home.stateVersion = "23.05"; # Please read the comment before changing.

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs;
    [ lutris
      hermit
      xclip
      neofetch
      discord
      scrot
      dejavu_fonts
      ipafont
      (pkgs.nerdfonts.override { fonts = [ "Hermit" ]; })
      alacritty
      wine
      winetricks
    ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "emacs -nw";
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;
}
