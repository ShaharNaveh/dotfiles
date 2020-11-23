"""
Icons from https://www.nerdfonts.com/cheat-sheet

Icons used, ATM:
nf-fa-firefox
nf-dev-terminal
nf-fa-code
nf-seti-config
nf-mdi-folder
nf-fa-video_camera
nf-mdi-layers
"""
from libqtile.command import lazy
from libqtile.config import DropDown, Group, Key, Match, ScratchPad

from settings.constants import mod, terminal

from settings.keys import keys

groups = [
    Group(
        "WWW",
        label="  ",
        layout="max",
        # layout="monadtall",
        matches=[Match(wm_class=["Firefox", "Tor Browser"])],
    ),
    Group(
        "SYS",
        label="   ",
        layout="monadtall",
    ),
    Group(
        "CODE",
        label="   ",
        layout="monadtall",
    ),
    Group(
        "CONFIG",
        layout="monadtall",
        label="   ",
    ),
    Group(
        "DIRS", label="   ", layout="monadtall", matches=[Match(wm_class=["Pacmanfm"])]
    ),
    Group(
        "ZOOM",
        label="   ",
        layout="monadtall",
    ),
    Group(
        "VBOX",
        label="  ",
        layout="monadtall",
        matches=[
            Match(wm_class=["VirtualBox", "VirtualBox Machine", "VirtualBox Manager"])
        ],
    ),
]

for index, group in enumerate(groups, start=1):
    group_key = str(index)
    keys.extend(
        [
            Key([mod], group_key, lazy.group[group.name].toscreen()),
            Key([mod, "shift"], group_key, lazy.window.togroup(group.name)),
        ]
    )


groups.append(
    ScratchPad(
        "scratchpad",
        [
            DropDown(
                "term",
                terminal,
                opacity=1,
                height=0.50,
                width=0.60,
                x=0.23,
                y=0.32,
            )
        ],
    )
)
keys.extend([Key([mod], "minus", lazy.group["scratchpad"].dropdown_toggle("term"))])
