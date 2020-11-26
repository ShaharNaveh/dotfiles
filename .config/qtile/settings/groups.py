from libqtile.command import lazy
from libqtile.config import DropDown, Group, Key, Match, ScratchPad

from settings.constants import mod, terminal

from settings.keys import keys

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet
groups = [
    Group(
        "SYS",
        label="",  # ICON: nf-dev-terminal
        layout="monadtall",
    ),
    Group(
        "WWW",
        label="",  # ICON: nf-fa-firefox
        layout="max",
        matches=[Match(wm_class=["firefox", "Tor Browser"])],
    ),
    Group(
        "CODE",
        label="",  # ICON: nf-fa-code
        layout="monadtall",
    ),
    Group(
        "DOC",
        label="",  # ICON: nf-mdi-file_document
        layout="monadtall",
    ),
    Group(
        "VBOX",
        label="",  # ICON: nf-mdi-layers
        layout="monadtall",
        matches=[
            Match(wm_class=["VirtualBox", "VirtualBox Machine", "VirtualBox Manager"])
        ],
    ),
    Group(
        "ZOOM",
        label="",  # ICON: nf-fa-video_camera
        layout="max",
        matches=[Match(wm_class=["zoom"])],
    ),
    Group(
        "TELEGRAM",
        label="",  # ICON: nf-fae-telegram
        layout="max",
        matches=[Match(wm_class=["TelegramDesktop", "telegram-desktop"])],
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
