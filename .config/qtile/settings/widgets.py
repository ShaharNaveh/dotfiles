from libqtile import widget

from settings.constants import qtile_config_dir
from settings.theme import colors

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet

primary_widgets = [
    widget.Sep(
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=2,
    ),
    widget.GroupBox(
        active=colors["foreground"],
        background=colors["background"],
        center_aligned=True,
        disable_drag=True,
        font="UbuntuMono Nerd Font",
        foreground=colors["foreground"],
        fontsize=14,
        highlight_color=colors["background_2"],
        highlight_method="block",
        inactive=colors["gray"],
        margix_x=1,
        margin_y=3,
        other_current_screen_border=colors["background_2"],
        other_screen_border=colors["background_2"],
        padding_y=8,
        padding_x=5,
        rounded=False,
        spacing=0,
        this_current_screen_border=colors["background_4"],
        this_screen_border=colors["background_4"],
        urgent_alert_method="block",
        urgent_border=colors["red_hard"],
    ),
    widget.Sep(  # Between Groupbox and Window name.
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=5,
    ),
    widget.WindowName(
        background=colors["background"],
        font="UbuntuMono Nerd Font",
        fontsize=14,
        foreground=colors["foreground"],
        padding=5,
    ),
    widget.Sep(  # Between Window name and widgets.
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=20,
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background_1"],
        fontsize=12,
        foreground=colors["foreground"],
        padding=2,
        text=" ",  # ICON: nf-fa-thermometer_3
    ),
    widget.ThermalSensor(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=5,
        threshold=90,
    ),
    widget.Image(
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background"],
        fontsize=14,
        foreground=colors["foreground"],
        padding=2,
        text=" ",  # ICON: nf-fa-microchip
    ),
    widget.CPU(
        background=colors["background"],
        foreground=colors["foreground"],
        format="{load_percent}%",
        padding=5,
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background_1"],
        fontsize=14,
        foreground=colors["foreground"],
        padding=0,
        text=" ",  # ICON: nf-mdi-memory
    ),
    widget.Memory(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=4,
    ),
    widget.Image(
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background"],
        fontsize=14,
        foreground=colors["foreground"],
        padding=2,
        text=" ",  # ICON: nf-mdi-package_up
    ),
    widget.CheckUpdates(
        background=colors["background"],
        colour_have_updates=colors["aqua_hard"],
        display_format="{updates}",
        distro="Arch",
        foreground=colors["foreground"],
        update_interval=1800,
    ),
    widget.TextBox(
        background=colors["background"],
        foreground=colors["foreground"],
        padding=5,
        text="Updates",
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=0,
        text=" ",  # ICON: nf-mdi-keyboard
    ),
    widget.KeyboardLayout(
        background=colors["background_1"],
        configured_keyboards=["us", "il"],
        foreground=colors["foreground"],
        padding=5,
    ),
    widget.Image(
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
        scale=True,
    ),
    widget.Clock(
        background=colors["background"],
        foreground=colors["foreground"],
        format=" %a, %b %d %H:%M ",
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.CurrentLayoutIcon(
        background=colors["background_1"],
        foreground=colors["foreground"],
        scale=True,
    ),
]


secondary_widgets = [
    widget.Sep(
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=2,
    ),
    widget.GroupBox(
        active=colors["foreground"],
        background=colors["background"],
        center_aligned=True,
        disable_drag=True,
        font="UbuntuMono Nerd Font",
        foreground=colors["foreground"],
        fontsize=14,
        highlight_color=colors["background_2"],
        highlight_method="block",
        inactive=colors["gray"],
        margix_x=1,
        margin_y=3,
        other_current_screen_border=colors["background_2"],
        other_screen_border=colors["background_2"],
        padding_y=8,
        padding_x=5,
        rounded=False,
        spacing=0,
        this_current_screen_border=colors["background_4"],
        this_screen_border=colors["background_4"],
        urgent_alert_method="block",
        urgent_border=colors["red_hard"],
    ),
    widget.Sep(  # Between Groupbox and Window name.
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=5,
    ),
    widget.WindowName(
        background=colors["background"],
        font="UbuntuMono Nerd Font",
        fontsize=14,
        foreground=colors["foreground"],
        padding=5,
    ),
    widget.Sep(  # Between Window name and widgets.
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=20,
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background_1"],
        fontsize=12,
        foreground=colors["foreground"],
        padding=2,
        text=" ",  # ICON: nf-fa-thermometer_3
    ),
    widget.ThermalSensor(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=5,
        threshold=90,
    ),
    widget.Image(
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background"],
        fontsize=14,
        foreground=colors["foreground"],
        padding=2,
        text=" ",  # ICON: nf-fa-microchip
    ),
    widget.CPU(
        background=colors["background"],
        foreground=colors["foreground"],
        format="{load_percent}%",
        padding=5,
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background_1"],
        fontsize=14,
        foreground=colors["foreground"],
        padding=0,
        text=" ",  # ICON: nf-mdi-memory
    ),
    widget.Memory(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=4,
    ),
    widget.Image(
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background"],
        fontsize=14,
        foreground=colors["foreground"],
        padding=2,
        text=" ",  # ICON: nf-mdi-package_up
    ),
    widget.CheckUpdates(
        background=colors["background"],
        colour_have_updates=colors["aqua_hard"],
        display_format="{updates}",
        distro="Arch",
        foreground=colors["foreground"],
        update_interval=1800,
    ),
    widget.TextBox(
        background=colors["background"],
        foreground=colors["foreground"],
        padding=5,
        text="Updates",
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.TextBox(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=0,
        text=" ",  # ICON: nf-mdi-keyboard
    ),
    widget.KeyboardLayout(
        background=colors["background_1"],
        configured_keyboards=["us", "il"],
        foreground=colors["foreground"],
        padding=5,
    ),
    widget.Image(
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
        scale=True,
    ),
    widget.Clock(
        background=colors["background"],
        foreground=colors["foreground"],
        format=" %a, %b %d %H:%M ",
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
        scale=True,
    ),
    widget.CurrentLayoutIcon(
        background=colors["background_1"],
        foreground=colors["foreground"],
        scale=True,
    ),
]


widget_defaults = {
    "background": colors["background"],
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
