from libqtile import qtile

if qtile.core.name == "x11":
    LAUNCHER_SHOW = "/usr/bin/rofi -show"
    LAUNCHER_SHOW_DRUN = "/usr/bin/rofi -show drun"
elif qtile.core.name == "wayland":
    LAUNCHER_SHOW = "/usr/bin/wofi --show"
    LAUNCHER_SHOW_DRUN = "/usr/bin/wofi --show drun"
