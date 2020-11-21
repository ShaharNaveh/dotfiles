from libqtile.command import lazy
from libqtile.config import Key

from settings.constants import browser, mod, terminal

keys = [
    Key([mod], "j", lazy.layout.down(), desc="Move focus down in stack pane"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up in stack pane"),
    Key([mod], "h", lazy.layout.shrink_main()),
    Key([mod], "l", lazy.layout.grow_main()),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.shuffle_down(),
        desc="Move window down in current stack",
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.shuffle_up(),
        desc="Move window up in current stack",
    ),
    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "o", lazy.layout.maximize()),
    Key([mod], "g", lazy.window.toggle_fullscreen()),
    Key([mod], "p", lazy.layout.flip()),
    Key(
        [mod],
        "space",
        lazy.layout.next(),
        desc="Switch window focus to other pane(s) of stack",
    ),
    # Swap panes of split stack
    Key(
        [mod, "shift"], "space", lazy.layout.rotate(), desc="Swap panes of split stack"
    ),
    Key([mod], "Return", lazy.spawn(f"{terminal} -e tmux"), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.restart(), desc="Restart qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown qtile"),
    Key(
        [mod],
        "comma",
        lazy.spawn("/usr/bin/rofi -combi-modi window,drun -show combi -modi combi"),
        desc="Launch rofi",
    ),
    Key([mod], "b", lazy.spawn(browser), desc=f"Launch {browser}"),
]
