"""
Icons from https://www.nerdfonts.com/cheat-sheet

Icons used, ATM:
nf-fa-firefox
nf-fae-python
nf-dev-terminal
nf-fa-code
nf-seti-config
nf-mdi-folder
nf-mdi-image
nf-fa-video_camera
nf-mdi-layers
"""


from libqtile.config import Key, Group
from libqtile.command import lazy

from settings.keys import keys
from settings.constants import mod, terminal

groups = [

            Group("  "),
            Group("   "),
            Group("   "),
            Group("   "),
            Group("   "),
            Group("   "),
            Group("   "),
            Group("   "),
            Group("   "),

        ]

for index, group in enumerate(groups, start=1):
    group_key = str(index)
    keys.extend([
        Key([mod], group_key, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], group_key, lazy.window.togroup(group.name))
        ])



'''
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
'''

