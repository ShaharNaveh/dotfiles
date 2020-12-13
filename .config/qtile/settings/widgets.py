from libqtile import widget

from settings.constants import qtile_config_dir
from settings.theme import colors

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet


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


widget_defaults = {
    #"background": colors["background"],
    "font": "UbuntuMono Nerd Font Bold",
    "fontsize": 14,
    "padding": 1,
}

extension_defaults = widget_defaults.copy()
