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
    # widget.Image(
    # background=colors["background"],
    # filename=str(qtile_config_dir / "images" / "penguin.png"),
    # scale=True,
    # ),
    # widget.Sep(  # Between image and group box
    # background=colors["background"],
    # foreground=colors["background_hard_0"],
    # linewidth=0,
    # padding=0,
    # ),
    widget.GroupBox(
        active=colors["foreground"],
        background=colors["background"],
        center_aligned=True,
        font="UbuntuMono Nerd Font",
        foreground=colors["foreground"],
        fontsize=14,
        margix_x=1,
        margin_y=3,
        padding_y=8,
        padding_x=5,
        spacing=0,
        inactive=colors["gray"],
        rounded=False,
        highlight_method="block",
        highlight_color=colors["background_2"],
        this_current_screen_border=colors["background_2"],
        this_screen_border=colors["background_2"],
        other_current_screen_border=colors["background_2"],
        other_screen_border=colors["background_2"],
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
        padding=5,
        fontsize=14,
        background=colors["background"],
        foreground=colors["foreground"],
        font="UbuntuMono Nerd Font",
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
        text=" ",  # ICON: nf-fa-thermometer_3
        padding=2,
        foreground=colors["foreground"],
        background=colors["background_1"],
        fontsize=12,
    ),
    widget.ThermalSensor(
        foreground=colors["foreground"],
        background=colors["background_1"],
        threshold=90,
        padding=5,
    ),
    widget.Image(
        scale=True,
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
    ),
    widget.TextBox(
        text=" ",  # ICON: nf-fa-microchip
        padding=2,
        foreground=colors["foreground"],
        background=colors["background"],
        fontsize=14,
    ),
    widget.CPU(
        foreground=colors["foreground"],
        background=colors["background"],
        padding=5,
        format="{load_percent}%",
    ),
    widget.Image(
        scale=True,
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
    ),
    widget.TextBox(
        text=" ",  # ICON: nf-mdi-memory
        foreground=colors["foreground"],
        background=colors["background_1"],
        padding=0,
        fontsize=14,
    ),
    widget.Memory(
        background=colors["background_1"],
        foreground=colors["foreground"],
        padding=4,
    ),
    widget.Image(
        scale=True,
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
    ),
    widget.TextBox(
        text=" ",  # ICON: nf-mdi-package_up
        padding=2,
        foreground=colors["foreground"],
        background=colors["background"],
        fontsize=14,
    ),
    widget.CheckUpdates(
        background=colors["background"],
        distro="Arch",
        foreground=colors["foreground"],
        update_interval=1800,
    ),
    widget.TextBox(
        text="Updates",
        foreground=colors["foreground"],
        background=colors["background"],
        padding=5,
    ),
    widget.Image(
        scale=True,
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
    ),
    widget.TextBox(
        text=" ",  # ICON: nf-mdi-keyboard
        foreground=colors["foreground"],
        background=colors["background_1"],
        padding=0,
    ),
    widget.KeyboardLayout(
        background=colors["background_1"],
        configured_keyboards=["us", "il"],
        padding=5,
        foreground=colors["foreground"],
    ),
    widget.Image(
        scale=True,
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
    ),
    widget.Clock(
        foreground=colors["foreground"],
        background=colors["background"],
        format=" %a, %b %d %H:%M ",
    ),
    widget.Image(
        scale=True,
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
    ),
    widget.CurrentLayoutIcon(
        background=colors["background_1"],
        foreground=colors["foreground"],
        scale=True,
    ),
    # widget.Sep(
    # linewidth=0,
    # padding=10,
    # foreground=colors["foreground"],
    # background=colors["background_1"],
    # ),
    # widget.Image(
    # scale=True,
    # background=colors["background_1"],
    # filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
    # ),
]


widget_defaults = {
    "background": colors["background"],
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
