{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./style.css;
    settings = [{
      # ---- Settings ----

      position = "bottom";
      height = 30;
      spacing = 4;

      modules-left = [
        "hyprland/workspaces"
        "hyprland/window"
      ];
      modules-center = [
        "mpd"
      ];
      modules-right = [
        "memory"
        "cpu"
        "temperature"
        "network"
        "pulseaudio"
        "clock#utc"
        "clock"
        "tray"
      ];

      keyboard-state = {
          numlock = true;
          capslock = true;
          format = "{name} {icon}";
          format-icons = {
              locked = "";
              unlocked = "";
          };
      };
      mpd = {
        format = "{stateIcon} {consumeIcon}{randomIcon}{repeatIcon}{singleIcon}{artist} - {album} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S}) ";
        format-disconnected = "Disconnected ";
        format-stopped = "{consumeIcon}{randomIcon}{repeatIcon}{singleIcon}Stopped ";
        unknown-tag = "N/A";
        interval = 2;
        consume-icons = {
            on = " ";
        };
        random-icons = {
            # off = "<span color=\"#f53c3c\"></span> ";
            on = " ";
        };
        repeat-icons = {
            on = " ";
        };
        single-icons = {
            on = "1 ";
        };
        state-icons = {
            # paused = "";
            # playing = "";
            paused = "";
            playing = "";
        };
        tooltip-format = "MPD (connected)";
        tooltip-format-disconnected = "MPD (disconnected)";
        on-click = "ario";
      };
      tray = {
          # icon-size = 21;
          spacing = 10;
      };
      clock = {
          timezone = "America/Boise";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a %Y %b %d %H:%M %Z}";
          format-alt = "{:%W %a %Y %b %d %H:%M:%S %Z}";
      };
      "clock#utc" = {
          timezone = "UTC";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          format = "{:%a %H:%M %Z}";
          format-alt = "{:%W %a %Y %b %d %H:%M:%S %Z}";
      };
      cpu = {
          format = "{usage}% ";
          format-alt = "CPU {usage}% ";
          tooltip = false;
      };
      memory = {
          format = "{}% ";
          format-alt = "RAM {}% ";
      };
      temperature = {
          # thermal-zone = 2;
          # hwmon-path = "/sys/class/hwmon/hwmon2/temp1_input";
          # critical-threshold = 80;
          # format-critical = "{temperatureC}°C {icon}";
          format = "{temperatureF}°F {icon}";
          format-alt = "{temperatureC}°C {icon}";
          format-icons = ["" "" ""];
      };
      network = {
          # interface = "wlp2*"; # (Optional) To force the use of this interface
          format-wifi = "{essid} ({signalStrength}%) ";
          format-ethernet = "{ipaddr}/{cidr} ";
          tooltip-format = "{ifname} via {gwaddr} ";
          format-linked = "{ifname} (No IP) ";
          format-disconnected = "Disconnected ⚠";
          format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      pulseaudio = {
          # scroll-step = 1; # %, can be a float
          format = "{volume}% {icon} {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-source = "{volume}% ";
          format-source-muted = "";
          format-icons = {
              headphone = "";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              default = ["" "" ""];
          };
          # on-click = "pavucontrol",
          # on-click-right = "bluetoothctl connect CA:BD:EF:01:A7:36";
      };

    }];
  };
}
