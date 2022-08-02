from libqtile import qtile  # type: ignore

match qtile.core.name:
    case "x11":
        LAUNCHER_SHOW = "/usr/bin/rofi -show"
        LAUNCHER_SHOW_DRUN = "/usr/bin/rofi -show drun"
    case "wayland":
        LAUNCHER_SHOW = "/usr/bin/wofi --show"
        LAUNCHER_SHOW_DRUN = "/usr/bin/wofi --show drun"
