{ config, pkgs, ... }:

{
  imports = [
    ./waybar/waybar.nix
    ./mc/prism.nix
  ];

  home.packages = with pkgs; [
    wl-clipboard
    dolphin 
    wofi
    google-chrome
    firefox
    ario
    procps
    font-awesome
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "wofi";
      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, W, killactive,"
        # "$mainMod, Q, exec, wlogout"
        "$mainMod SHIFT, Q, exit,"
        "$mainMod, F, togglefloating,"
        "$mainMod, P, pseudo,"
        "$mainMod, J, togglesplit,"

        # Start file manager
        "$mainMod, E, exec, $fileManager"

        # Lock desktop
        # "$mainMod, L, exec, bash .config/swaylock/lock.sh"

        # Reload waybar/waybar
        "$mainMod SHIFT, B, exec, pkill waybar && waybar"

        # Open terminal
        "$mainMod, T, exec, $terminal"

        # Open Wofi
        # "$mainMod, SPACE, exec, $menu"

        # Open VS Code
        "$mainMod, X, exec, code"

        # Clipboard History
        # "$mainMod, V, exec, cliphist list | wofi --show dmenu -H 600 -W 900 | cliphist decode | wl-copy"

        # Media Keys
        ", XF86AudioPlay, exec, mpc toggle"
        ", XF86AudioPrev, exec, mpc prev"
        ", XF86AudioNext, exec, mpc next"

        # Internet Browsers
        # "$mainMod, B, exec, google-chrome-stable --profile-directory=\"Default\" --new-window"
        # "$mainMod ALT, B, exec, google-chrome-stable --profile-directory=\"Profile 1\" --new-window"
        "$mainMod, B, exec, google-chrome-stable"
        "$mainMod ALT, B, exec, firefox"

        # Minecraft
        # "$mainMod, N, exec, multimc -l \"Dragon Egg Dome\""
        # "$mainMod, M, exec, multimc -l \"Purple Cello Server\""
        # "$mainMod SHIFT, M, exec, multimc"
        "$mainMod , M, exec, prismlauncher"

        # Move focus with mainMod + arrow keys
        "$mainMod, left, movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up, movefocus, u"
        "$mainMod, down, movefocus, d"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        "$mainMod, TAB, workspace, e+1"
        "$mainMod SHIFT, TAB, workspace, e-1"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
