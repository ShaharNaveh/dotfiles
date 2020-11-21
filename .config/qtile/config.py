from libqtile import bar, hook, layout, widget
from libqtile.config import Click, Drag, DropDown, Group, Key, ScratchPad, Screen
from libqtile.lazy import lazy

from settings.constants import mod, terminal
from settings.keys import keys
from settings.groups import groups

L_ALT = "mod1"
FONT = "DroidSansMono Nerd Font"
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





layout_theme = {
    "border_width": 2,
    "border_focus": bordercolor,
    "border_normal": bgcolor,
    "single_margin": 0,
    "single_border_width": 0,
    "margin": 8,
    "font": FONT,
}

layouts = [
    # layout.Max(),
    # layout.Floating(),
    layout.MonadTall(**layout_theme, ratio=0.63),
]

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
                    filename="~/.config/qtile/Images/me.jpg",
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
                    filename="~/.config/qtile/Images/bar03.png",
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
                    filename="~/.config/qtile/Images/bar01.png",
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
                    filename="~/.config/qtile/Images/bar02.png",
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
                    filename="~/.config/qtile/Images/bar01.png",
                    background=COLOR_6,
                ),
                widget.TextBox(
                    text=" Vol:", foreground=COLOR_2, background=COLOR_4, padding=0
                ),
                #widget.Volume(foreground=COLOR_2, background=COLOR_4, padding=5),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/Images/bar02.png",
                    background=COLOR_6,
                ),
                widget.CurrentLayout(foreground=COLOR_2, background=COLOR_5, padding=5),
                widget.Image(
                    scale=True,
                    filename="~/.config/qtile/Images/bar01.png",
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

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

floating_types = ["notification", "toolbar", "splash", "dialog"]


@hook.subscribe.client_new
def set_floating(window):
    if (
        window.window.get_wm_transient_for()
        or window.window.get_wm_type() in floating_types
    ):
        window.floating = True


dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"

floating_layout = layout.Floating(
    fullscreen_border_width=0,
    border_width=0,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
        {"wname": "Open File"},
        # {"wmclass": "VirtualBox"}, # Virtualbox
    ],
)

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
