{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      live_config_reload = false;
      font = {
        normal.family = "Hurmit Nerd Font Mono";
        size = 12;
      };
      window.padding = {
        x = 4;
        y = 4;
      };
      window.dynamic_padding = true;
    };
  };
}
