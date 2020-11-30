from libqtile import hook, layout

from settings.constants import font
from settings.theme import colors

layout_configuration = {
    "border_width": 2,
    "single_margin": 0,
    "single_border_width": 0,
    "margin": 8,
    "border_focus": colors["focus"][0],
    "font": font,
}


layouts = [
    layout.Max(**layout_configuration),
    # layout.Matrix(**layout_configuration),
    layout.Tile(**layout_configuration),
    layout.MonadTall(**layout_configuration, ratio=0.63),
    layout.MonadWide(**layout_configuration, ratio=0.63),
]

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
        {"wname": "Open File"},
    ],
    fullscreen_border_width=0,
    border_width=0,
    border_focus=colors["color4"][0],
)


floating_types = [
    "notification",
    "toolbar",
    "splash",
    "dialog",
    "utility",
    "menu",
    "dropdown_menu",
    "popup_menu",
    "tooltip,dock",
]


@hook.subscribe.client_new
def set_floating(window):
    if (
        window.window.get_wm_transient_for()
        or window.window.get_wm_type() in floating_types
    ):
        window.floating = True
