from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Screen, EzKey
from libqtile.lazy import lazy

mod = "mod4"
MOD = "mod4"
L_ALT = "mod1"
TERMINAL = "alacritty"
BROWSER = "firefox"

# monadtall extention to follow maximized window if we have only two
@lazy.function
def z_maximize(qtile):
    layout = qtile.current_layout
    group = qtile.current_group

    if layout.name == "monadtall":
        layout.cmd_maximize()
        if len(group.windows) != 2:
            return

    if layout.name == "columns":
        # developped for 2 windows...

        if len(group.windows) < 2:
            return

        min_ratio = 0.25
        layout_width = group.screen.dwidth
        fw = qtile.current_window
        if layout_width / 2 < fw.width:
            # minimize
            if fw.x == 0:
                cmd = layout.cmd_grow_left
            else:
                cmd = layout.cmd_grow_right
            while fw.width > layout_width * min_ratio:
                cmd()
        else:
            # maximize
            if fw.x == 0:
                cmd = layout.cmd_grow_right
            else:
                cmd = layout.cmd_grow_left
            while fw.width < layout_width * (1 - min_ratio):
                cmd()

    fw = qtile.current_window
    ow = None
    # get other window
    for w in group.windows:
        if w != fw:
            ow = w

    if ow and fw.info()["width"] < ow.info()["width"]:
        layout.cmd_next()


keys = [
    # Switch between windows
    EzKey("A-h", lazy.layout.left()),
    EzKey("A-j", lazy.layout.down()),
    EzKey("A-k", lazy.layout.up()),
    EzKey("A-l", lazy.layout.right()),

    EzKey("A-<Left>", lazy.layout.left()),
    EzKey("A-<Down>", lazy.layout.down()),
    EzKey("A-<Up>", lazy.layout.up()),
    EzKey("A-<Right>", lazy.layout.right()),
    # Move windows
    EzKey("M-S-h", lazy.layout.shuffle_left()),
    EzKey("M-S-j", lazy.layout.shuffle_down()),
    EzKey("M-S-k", lazy.layout.shuffle_up()),
    EzKey("M-S-l", lazy.layout.shuffle_right()),
    # Grow windows
    EzKey("M-C-h", lazy.layout.grow_left()),
    EzKey("M-C-j", lazy.layout.grow_down()),
    EzKey("M-C-k", lazy.layout.grow_up()),
    EzKey("M-C-l", lazy.layout.grow_right()),
    # Flip windows
    EzKey("M-A-h", lazy.layout.flip_left()),
    EzKey("M-A-l", lazy.layout.flip_right()),
    EzKey("M-A-j", lazy.layout.flip_down()),
    EzKey("M-A-k", lazy.layout.flip_up()),
    #EzKey("M-S-<Return>", lazy.layout.toggle_split()),
    # Monadtall additional
    EzKey("M-i", lazy.layout.grow()),
    EzKey("M-m", lazy.layout.shrink()),
    EzKey("M-o", z_maximize, desc="maximize window"),
    EzKey("M-n", lazy.layout.normalize(), desc="reset layout"),
    EzKey("M-S-<space>", lazy.layout.flip()),
    # Switch window focus to other pane(s) of stack
    EzKey("M-<space>", lazy.layout.next(), desc="next window"),
    # Focus screen
    EzKey("M-<comma>", lazy.prev_screen()),
    EzKey("M-<period>", lazy.next_screen()),
    EzKey("M-<Return>", lazy.spawn(TERMINAL)),
    EzKey("M-A-<Return>", lazy.spawn(f"{TERMINAL} -e tmux")),
    EzKey(
        "A-S-<space>",
        lazy.widget["keyboardlayout"].next_keyboard(),
        desc="switch keyboard layout",
    ),
    EzKey("M-<Tab>", lazy.next_layout()),
    EzKey("M-S-w", lazy.window.kill(), desc="close window"),
    EzKey("M-C-w", lazy.spawn("xkill"), desc="kill window"),
    EzKey("M-S-x", lazy.hide_show_bar("top"), desc="toggle top bar"),
    EzKey("M-C-x", lazy.hide_show_bar("bottom"), desc="toggle bottom bar"),
    EzKey("M-C-r", lazy.restart()),
    EzKey("M-C-f", lazy.window.toggle_floating()),
    EzKey("M-f", lazy.window.toggle_fullscreen()),
    EzKey("M-C-v", lazy.validate_config()),
    EzKey("M-S-<Return>", lazy.spawn("rofi -show run")),
]

"""
# GROUPS
GROUP_NAMES = [
    ("SYS", {"layout": "monadtall"}),
    ("DEV", {"layout": "monadtall"}),
]

groups = [Group(name, **kwargs) for name, kwargs in GROUP_NAMES]

for i, (name, kwargs) in enumerate(GROUP_NAMES, start=1):
    keys.append(
        Key([mod], str(i), lazy.group[name].toscreen())
    )  # Switch to another group
"""

groups = [Group(i) for i in "1234567890"]

for i in groups:
    group_name = i.name
    keys.extend(
        [
            EzKey(f"M-{group_name}", lazy.group[group_name].toscreen(toggle=True)),
            EzKey(f"M-S-{group_name}", lazy.window.togroup(group_name)),
        ]
    )

"""
for i in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )
"""

# layout.Bsp(),
# layout.Columns(),
# layout.Matrix(),
# layout.MonadWide(),
# layout.RatioTile(),
# layout.Tile(),
# layout.TreeTab(),
# layout.VerticalTile(),
# layout.Zoomy(),
layouts = [
    layout.Max(),
    # layout.Stack(num_stacks=2),
    layout.Floating(),
    layout.MonadTall(),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", foreground="#d75f5f"),
                widget.Systray(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                widget.QuickExit(),
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

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
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
    ]
)
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
