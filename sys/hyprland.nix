{ config, pkgs, ... }:

{

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  hardware.graphics.enable = true;

  environment.systemPackages = with pkgs; [
    waybar
    dunst
    libnotify
    kitty
    wofi
  ];

}
