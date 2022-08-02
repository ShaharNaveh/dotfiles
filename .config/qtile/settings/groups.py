import re

from libqtile.command import lazy  # type: ignore
from libqtile.config import DropDown, Group, Key, Match, ScratchPad  # type: ignore
from settings.constants import mod, terminal  # type: ignore
from settings.keys import keys  # type: ignore

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet


group_names = [
    (
        "WWW",
        {
            "label": "",  # ICON: nf-fa-firefox
            "matches": [
                Match(wm_class=["Tor Browser"]),
                Match(wm_class=["firefox"]),
            ],
        },
    ),
    (
        "DOC",
        {
            "label": "",  # ICON: nf-mdi-file_document
            "matches": [
                Match(wm_class=["libreoffice"]),
                Match(wm_class=["libreoffice-calc"]),
                Match(wm_class=["libreoffice-draw"]),
                Match(wm_class=["libreoffice-impress"]),
                Match(wm_class=["libreoffice-math"]),
                Match(wm_class=["libreoffice-writer"]),
                Match(wm_class=["soffice"]),
            ],
        },
    ),
    (
        "CODE",
        {
            "label": "",  # ICON: nf-fa-code
            "matches": [Match(wm_class=["code-oss"])],
        },
    ),
    (
        "SYS",
        {
            "label": "ﲵ",  # ICON: nf-mdi-console_line
        },
    ),
    (
        "MSG",
        {
            "label": "",  # ICON: nf-fa-comment
            "matches": [
                Match(wm_class=["telegram-desktop"]),
                Match(wm_class=["discord"]),
            ],
        },
    ),
    (
        "VIRT_N_DB",
        {
            "label": "",  # ICON: nf-mdi-layers
            "matches": [
                Match(wm_class=["VirtualBox"]),
                Match(wm_class=["VirtualBox Machine"]),
                Match(wm_class=["VirtualBox Manager"]),
                Match(wm_instance_class=["mongodb compass"]),
                Match(wm_class=["MongoDB Compass"]),
                Match(wm_class=["robo3t"]),
            ],
        },
    ),
    (
        "MEETING",
        {
            "label": "辶",  # ICON: nf-mdi-video
            "matches": [
                Match(wm_instance_class=["zoom "], wm_class=["zoom "]),
                Match(title=["Zoom Meeting"]),
                Match(title=[re.compile("zoom Meeting", re.IGNORECASE)]),
                Match(wm_instance_class=[re.compile(r"^join\?action=", re.IGNORECASE)]),
            ],
        },
    ),
    (
        "OTHER",
        {
            "label": "ﬓ",  # ICON: nf-mdi-application
            "matches": [Match(wm_class=["qBittorrent"])],
        },
    ),
    (
        "SETTINGS",
        {
            "label": "",
            "matches": [Match(wm_class="pavucontrol")],
        },
    ),
]

groups = []

for (name, kwargs) in group_names:
    groups.append(Group(name, **kwargs))

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
