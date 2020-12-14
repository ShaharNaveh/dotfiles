from libqtile import widget

from settings.constants import qtile_config_dir
from settings.theme import colors

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet
"""
def base(background: str = "dark", foreground: str = "text") -> dict:
    return {"background": colors[background], "foreground": colors[foreground]}


def separator():
    return widget.Sep(**base(), linewidth=0, padding=5)


def icon(
    background: str = "dark",
    fontsize: int = 16,
    foreground: str = "text",
    text: str = "?",
):
    return widget.TextBox(
        **base(background=background, foreground=foreground),
        fontsize=fontsize,
        padding=3,
        text=text,
    )


def powerline(background: str = "dark", foreground: str = "light"):
    return widget.TextBox(
        **base(background=background, foreground=foreground),
        text="",  # ICON: nf-oct-triangle_left
        fontsize=37,
        padding=-4,
    )


def workspaces() -> list:
    return [
        separator(),
        widget.GroupBox(
            **base(foreground="light"),
            active=colors["active"],
            borderwidth=1,
            disable_drag=True,
            font="UbuntuMono Nerd Font",
            fontsize=19,
            highlight_method="block",
            inactive=colors["inactive"],
            margin_x=1,
            margin_y=3,
            other_current_screen_border=colors["dark"],
            other_screen_border=colors["dark"],
            padding_x=10,
            padding_y=8,
            rounded=False,
            this_current_screen_border=colors["focus"],
            this_screen_border=colors["grey"],
            urgent_alert_method="block",
            urgent_border=colors["urgent"],
        ),
        separator(),
        widget.WindowName(**base(foreground="focus"), fontsize=14, padding=5),
        separator(),
    ]
primary_widgets = [
    *workspaces(),
    separator(),
    #powerline(background="dark", foreground="color4"),
    #icon(
        #background="color4",
        #text=" ", # ICON: nf-fa-download
        #),
    #widget.Pacman(**base(background="color4"), update_interval=1800),
    powerline(background="dark", foreground="color3"),
    icon(
        background="color3",
        text=" ﯱ ",  # ICON: nf-mdi-network
    ),
    widget.Net(**base(background="color3"), format="{down} ↓↑ {up}"),
    powerline(background="color3", foreground="color2"),
    widget.CurrentLayoutIcon(**base(background="color2"), scale=0.65),
    widget.CurrentLayout(**base(background="color2"), padding=5),
    powerline(background="color2", foreground="color1"),
    icon(
        background="color1",
        fontsize=17,
        text="  ",  # ICON: nf-mdi-calendar_clock
    ),
    widget.Clock(**base(background="color1"), format="%d/%m/%Y - %H:%M "),
    powerline(background="color1", foreground="dark"),
    widget.KeyboardLayout(
        background=colors["dark"], configured_keyboards=["us", "il"], padding=5
    ),
]

secondary_widgets = [
    *workspaces(),
    separator(),
    powerline(background="dark", foreground="color1"),
    widget.CurrentLayoutIcon(**base(background="color1"), scale=0.65),
    widget.CurrentLayout(**base(background="color1"), padding=5),
]
"""

primary_widgets = [
    widget.Sep(
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=2,
    ),
    widget.Image(
        background=colors["background"],
        filename=str(qtile_config_dir / "images" / "penguin.png"),
       scale=True,
  ),
    widget.Sep(  # Between image and group box
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=0,
    ),
    widget.GroupBox(
        active=colors["foreground"],
        background=colors["background"],
        center_aligned=True,
        font="UbuntuMono Nerd Font",
        foreground=colors["foreground"],
        fontsize=11,
        margix_x=3,
        margin_y=3,
        padding_y=5,
        padding_x=3,
        spacing=0,
        inactive=colors["foreground"],
        rounded=True,
        highlight_method="block",
        highlight_color=colors["background_2"],
        this_current_screen_border=colors["background_2"],
        this_screen_border=colors["background_2"],
        other_current_screen_border=colors["background_2"],
        other_screen_border=colors["background_2"],
    ),
    widget.Sep(  # Between Groupbox and Window name.
        background=colors["background"],
        foreground=colors["background_hard_0"],
        linewidth=0,
        padding=20,
    ),
    widget.TaskList(
        center_aligned=True,
        font="UbuntuMono Nerd Font",
        fontsize=12,
        foreground=colors["foreground"],
        background=colors["background"],
        border=colors["background_2"],
        spacing=6,
        margin_y=5,
        margin_x=3,
        padding_y=0,
        padding_x=3,
        max_title_width=300,
        highlight_color=colors["background_2"],
        highlight_method="block",
        rounded=True,
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
        #text=" ",
        padding=2,
        foreground=colors["foreground"],
        background=colors["background_1"],
        fontsize=12,
    ),
    #widget.ThermalSensor(
        #foreground=colors["foreground"],
        #background=colors["background_1"],
        #threshold=90,
        #padding=5,
   # ),
    widget.Image(
        scale=True,
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
    ),
    widget.TextBox(
       # text=" ",
        padding=2,
        foreground=colors["foreground"],
        background=colors["background"],
        fontsize=14,
    ),
    #widget.CPU(
        #foreground=colors["foreground"],
        #background=colors["background"],
        #padding=5,
        #format="{load_percent}%",
    #),
    widget.Image(
        scale=True,
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg1.png"),
    ),
    widget.TextBox(
        #text=" ",
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
        #text="",
        padding=2,
        foreground=colors["foreground"],
        background=colors["background"],
        fontsize=14,
    ),

    #widget.Pacman(
        #update_interval=1800,
        #foreground=colors["foreground"],
        #background=colors["background"],
    #),
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
        #text=" ",
        foreground=colors["foreground"],
        background=colors["background_1"],
        padding=0,
    ),
    #widget.Volume(
        #foreground=colors["foreground"], background=colors["background_1"], padding=5
    #),
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
    # systray (background=colors["background_1"])
    # TODO: ADD HERE THE KEYBOARD SWITCH
    widget.Sep(
        linewidth=0,
        padding=10,
        foreground=colors["foreground"],
        background=colors["background_1"],
    ),
    widget.Image(
        scale=True,
        background=colors["background_1"],
        filename=str(qtile_config_dir / "images" / "arrowleft-trans-bg.png"),
    ),
    #widget.CurrentLayoutIcon(
        #background=colors["background"],
        #foreground=colors["foreground"],
        #scale=True,
    #),
]


widget_defaults = {
    "background": colors["background"],
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
