from libqtile.command import lazy
from libqtile.config import DropDown, Group, Key, Match, ScratchPad

from settings.constants import mod, terminal

from settings.keys import keys

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet
group_names = [
    (
        "SYS",
        {
            "label": "",  # ICON: nf-dev-terminal
            "layout": "monadtall",
        },
    ),
    (
        "WWW",
        {
            "label": "",  # ICON: nf-fa-firefox
            "layout": "max",
            "matches": [Match(wm_class=["firefox", "Tor Browser"])],
        },
    ),
    (
        "CODE",
        {
            "label": "",  # ICON: nf-fa-code
            "layout": "monadtall",
        },
    ),
    (
        "DOC",
        {
            "label": "",  # ICON: nf-mdi-file_document
            "layout": "monadtall",
            "matches": [Match(wm_class=["libreoffice"])],
        },
    ),
    (
        "VBOX",
        {
            "label": "",  # ICON: nf-mdi-layers
            "layout": "monadtall",
            "matches": [
                Match(
                    wm_class=["VirtualBox", "VirtualBox Machine", "VirtualBox Manager"]
                )
            ],
        },
    ),
    (
        "ZOOM",
        {
            "label": "",  # ICON: nf-fa-video_camera
            "layout": "max",
            "matches": [Match(wm_class=["zoom"])],
        },
    ),
    (
        "TELEGRAM",
        {
            "label": "",  # ICON: nf-fae-telegram
            "layout": "max",
            "matches": [Match(wm_class=["TelegramDesktop", "telegram-desktop"])],
        },
    ),
]

groups = []

for index, (name, kwargs) in enumerate(group_names, start=1):
    kwargs["label"] = f"{index}{kwargs['label']}"
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
