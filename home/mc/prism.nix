{ config, pkgs, ... }:

{
    home.packages = with pkgs; [
        prismlauncher
        jdk21_headless
        # jdk17_headless
        # jdk8_headless
    ];
}
