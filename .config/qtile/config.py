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

bgcolor = "2c2e34"
bordercolor = "a49b80"
gray = "404040"
anothergray = "606060"
finalgray = "757575"
yellow = "e5c463"
red = "f85e84"
green = "9ecd6f"
magenta = "ab9df2"
blue = "7accd7"
orange = "ef9062"
white = "e3e1e4"

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
    Key([MOD], "Return", lazy.spawn(f"{TERMINAL} -e tmux"), desc="Launch terminal"),
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

#GROUP_NAMES = ["SYS", "DEV", "DOC", "VB"]

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
    "font": FONT,
    "fontsize": FONT_SIZE,
    "padding": 9,
    "background": bgcolor,
    "highlight_method": "text",
}


extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.GroupBox(
                    margin_y=3,
                    margin_x=0,
                    borderwidth=0,
                    rounded=False,
                    active=anothergray,
                    inactive=bgcolor,
                    highlight_color=red,
                    this_current_screen_border=yellow,
                    this_screen_border=anothergray,
                    foreground=white,
                    background=bgcolor,
                ),
                widget.Prompt(),
                widget.Spacer(),
                widget.CPU(format="{load_percent}%", foreground=white),
                widget.Memory(format="{MemUsed} MB", foreground=white),
                widget.DF(visible_on_warn=False, format="{uf} {m}B", foreground=white),
                widget.Clock(
                    format="%a %H:%M",
                    foreground=orange,
                ),
            ],
            24,
            opacity=1,
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
