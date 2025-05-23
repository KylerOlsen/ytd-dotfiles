{ config, pkgs, ... }:

{
  imports = [
    ./vscode.nix
    ./hyprland.nix
  ];

  home.username = "kyler";
  home.homeDirectory = "/home/kyler";

  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
  };

  home.sessionVariables = {
  };

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true;

  # programs.git = {
  # 	userEmail = "kylerolsen17@gmail.com";
  # 	userName = "Kyler Olsen";
  # };

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

}
