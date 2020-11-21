from libqtile import bar, widget
from libqtile.config import DropDown, ScratchPad, Screen

from settings.constants import mod  # noqa: F401
from settings.constants import terminal
from settings.layouts import floating_layout, layouts  # noqa: F401
from settings.mouse import mouse  # noqa: F401

from settings.keys import keys  # noqa: F401

from settings.groups import groups  # noqa: F401

FONT_SIZE = 14

bgcolor = "#2c2e34"
bordercolor = "#a49b80"
gray = "#404040"
anothergray = "#606060"
finalgray = "#757575"
yellow = "#e5c463"
red = "#f85e84"
green = "#9ecd6f"
magenta = "#ab9df2"
blue = "#7accd7"
orange = "#ef9062"
white = "#e3e1e4"

COLOR_0 = ["#272827", "#272827"]
COLOR_1 = ["#434758", "#434758"]
COLOR_2 = ["#ffffff", "#ffffff"]
COLOR_3 = ["#272827", "#272827"]
COLOR_4 = ["#F4883C", "#F4883C"]
COLOR_5 = ["#A44A29", "#A44A29"]
COLOR_6 = ["#F4883C", "#F4883C"]


widget_defaults = {
    "font": "Ubuntu Mono",
    "fontsize": 12,
    "padding": 2,
    "background": COLOR_0,
    "highlight_method": "text",
}


extension_defaults = widget_defaults.copy()


screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/me.jpg",
                    background=COLOR_6,
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=COLOR_2,
                    background=COLOR_0,
                ),
                widget.Clock(
                    foreground=COLOR_2,
                    background=COLOR_5,
                    format="%A, %B, %d [ %H:%M ]",
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=COLOR_2,
                    background=COLOR_0,
                ),
                widget.GroupBox(
                    font="Ubuntu Bold",
                    fontsize=12,
                    margin_y=3,
                    margin_x=0,
                    padding_y=5,
                    padding_x=3,
                    borderwidth=3,
                    active=COLOR_2,
                    inactive=COLOR_2,
                    rounded=False,
                    highlight_color=COLOR_1,
                    highlight_method="line",
                    this_current_screen_border=COLOR_3,
                    this_screen_border=COLOR_4,
                    other_current_screen_border=COLOR_0,
                    other_screen_border=COLOR_0,
                    foreground=COLOR_2,
                    background=COLOR_0,
                ),
                widget.Prompt(
                    font="Ubuntu Mono",
                    padding=10,
                    foreground=COLOR_3,
                    background=COLOR_1,
                ),
                widget.Sep(
                    linewidth=0,
                    padding=40,
                    foreground=COLOR_2,
                    background=COLOR_0,
                ),
                widget.WindowName(foreground=COLOR_0, background=COLOR_0, padding=0),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/bar03.png",
                    background=COLOR_6,
                ),
                widget.TextBox(
                    text=" 🌡",
                    padding=2,
                    foreground=COLOR_2,
                    background=COLOR_5,
                    fontsize=11,
                ),
                widget.ThermalSensor(
                    foreground=COLOR_2, background=COLOR_5, threshold=90, padding=5
                ),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/bar01.png",
                    background=COLOR_6,
                ),
                widget.TextBox(
                    text="",
                    foreground=COLOR_2,
                    background=COLOR_4,
                    padding=0,
                    fontsize=14,
                ),
                widget.CPU(
                    foreground=COLOR_2,
                    background=COLOR_4,
                    padding=5,
                    format="  {load_percent}%  ",
                ),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/bar02.png",
                    background=COLOR_6,
                ),
                widget.TextBox(
                    text=" 🖬",
                    foreground=COLOR_2,
                    background=COLOR_5,
                    padding=0,
                    fontsize=14,
                ),
                widget.Memory(
                    foreground=COLOR_2,
                    background=COLOR_5,
                    mouse_callbacks={
                        "Button1": lambda qtile: qtile.cmd_spawn(f"{terminal} -e htop")
                    },
                    padding=5,
                ),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/bar01.png",
                    background=COLOR_6,
                ),
                widget.TextBox(
                    text=" Vol:", foreground=COLOR_2, background=COLOR_4, padding=0
                ),
                # widget.Volume(foreground=COLOR_2, background=COLOR_4, padding=5),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/bar02.png",
                    background=COLOR_6,
                ),
                widget.CurrentLayout(foreground=COLOR_2, background=COLOR_5, padding=5),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/images/bar01.png",
                    background=COLOR_6,
                ),
                widget.Net(
                    format="{down} ↓↑ {up}",
                    foreground=COLOR_2,
                    background=COLOR_4,
                    padding=1,
                    update_interval=1,
                ),
                widget.Sep(
                    linewidth=0, padding=10, foreground=COLOR_0, background=COLOR_5
                ),
            ],
            24,
        ),
    ),
]


dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"


# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
