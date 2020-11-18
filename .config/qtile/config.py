from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, DropDown, Group, Key, ScratchPad, Screen
from libqtile.lazy import lazy

mod = "mod4"
MOD = "mod4"
L_ALT = "mod1"
TERMINAL = "alacritty"
BROWSER = "firefox"
FONT = "Noto Sans"
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

keys = [
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down in stack pane"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up in stack pane"),
    Key([MOD], "h", lazy.layout.shrink_main()),
    Key([MOD], "l", lazy.layout.grow_main()),
    Key(
        [MOD, "control"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down in current stack",
    ),
    Key(
        [MOD, "control"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up in current stack",
    ),
    Key([MOD], "n", lazy.layout.normalize()),
    Key([MOD], "o", lazy.layout.maximize()),
    Key([MOD], "g", lazy.window.toggle_fullscreen()),
    Key([MOD], "p", lazy.layout.flip()),
    Key(
        [MOD],
        "space",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack",
    ),
    # Swap panes of split stack
    Key(
        [MOD, "shift"], "space", lazy.layout.rotate(), desc="Swap panes of split stack"
    ),
    Key([MOD], "Return", lazy.spawn(TERMINAL), desc="Launch terminal"),
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([MOD, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([MOD, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key(
        [MOD],
        "comma",
        lazy.spawn("/usr/bin/rofi -combi-modi window,drun -show combi -modi combi"),
        desc="Launch rofi",
    ),
    Key([MOD], "b", lazy.spawn(BROWSER), desc=f"Launch {BROWSER}"),
]

group_names = [
    ("WWW", {"layout": "monadtall"}),
    ("DEV", {"layout": "monadtall"}),
    ("VBOX", {"layout": "monadtall"}),
    ("SYS", {"layout": "monadtall"}),
]
groups = [Group(name, **kwargs) for name, kwargs in group_names]

for index, group in enumerate(groups, start=1):
    group_name = group.name
    keys.extend(
        [
            Key([MOD], str(index), lazy.group[group_name].toscreen(toggle=True)),
            Key([MOD, "shift"], str(index), lazy.window.togroup(group_name)),
        ]
    )

groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                TERMINAL,
                opacity=1,
                height=0.50,
                width=0.60,
                x=0.23,
                y=0.32,
            )
        ],
    )
)
keys.extend([Key([MOD], "minus", lazy.group["scratchpad"].dropdown_toggle("term"))])

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
                    foreground=COLOR_2, background=COLOR_5, format="%A, %B, %d [ %H:%M ]"
                ),
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=COLOR_2,
                    background=COLOR_0,
                ),
                widget.GroupBox(
                    font="Ubuntu Bold",
                    fontsize=9,
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
                    format='  {load_percent}%  '
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
                        "Button1": lambda qtile: qtile.cmd_spawn(f"{TERMINAL} -e htop")
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
                widget.Volume(foreground=COLOR_2, background=COLOR_4, padding=5),
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
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"

floating_layout = layout.Floating(
    **layout_theme,
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
