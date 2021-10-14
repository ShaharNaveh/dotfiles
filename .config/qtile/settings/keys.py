from libqtile.command import lazy
from libqtile.config import Key

from settings.compat import LAUNCHER_SHOW, LAUNCHER_SHOW_DRUN
from settings.constants import browser, mod, terminal
#from settings.helpers import switch_language

keys = [
    Key([mod], "j", lazy.layout.down(), desc="Move focus down in stack pane"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up in stack pane"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus left in stack pane"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus right in stack pane"),
    Key(
        [mod, "shift"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down in stack pane",
    ),
    Key(
        [mod, "shift"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up in stack pane",
    ),
    Key(
        [mod, "shift"],
        "h",
        lazy.layout.shuffle_left(),
        desc="Move window left in stack pane",
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window right in stack pane",
    ),
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        desc="Increase the window size to the right",
    ),
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        desc="Increase the window size to the left",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        desc="Increase the window size upward",
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        desc="Increase the window size downward",
    ),
    Key([mod], "g", lazy.window.toggle_fullscreen()),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod], "p", lazy.layout.flip()),
    Key(
        [mod],
        "f",
        lazy.window.toggle_floating(),
        desc="Toggle between floating and non-floating",
    ),
    Key(
        [mod],
        "space",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack",
    ),
    Key(
        [mod, "shift"], "space", lazy.layout.rotate(), desc="Swap panes of split stack"
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key(
        [mod], "comma", lazy.spawn(LAUNCHER_SHOW_DRUN), desc="Display program launcher"
    ),
    Key(
        [mod, "shift"], "comma", lazy.spawn(LAUNCHER_SHOW), desc="Show running programs"
    ),
    Key([mod], "b", lazy.spawn(browser), desc=f"Launch {browser}"),
    Key([], "XF86AudioMute", lazy.spawn("amixer -c 0 set Speaker toggle")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 -q set Speaker 2dB+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 -q set Speaker 2dB-")),
    #Key(
    #    ["mod1"],
    #    "Shift_L",
        # lazy.widget["keyboardlayout"].next_keyboard(),
    #    switch_language(),
    #    desc="Change language",
    #),
]
