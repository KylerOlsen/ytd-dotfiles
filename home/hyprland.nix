{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

    };
  };
}
