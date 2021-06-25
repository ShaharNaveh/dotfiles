from libqtile import hook, layout
from libqtile.config import Match

from settings.constants import font
from settings.theme import colors

layout_configuration = {
    "border_width": 0,
    "single_margin": 0,
    "single_border_width": 0,
    "margin": 2,
    "border_focus": colors["background_2"][0],
    "font": font,
}


layouts = [
    layout.Max(**layout_configuration),
    # layout.Matrix(**layout_configuration),
    layout.Tile(**layout_configuration),
    layout.MonadTall(**layout_configuration, ratio=0.60),
    layout.MonadWide(**layout_configuration, ratio=0.60),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        Match(title="Open File"),
        Match(title="pinentry"),  # GPG key password entry
        Match(wm_class="confirm"),
        Match(wm_class="confirmreset"),
        Match(wm_class="dialog"),
        Match(wm_class="download"),
        Match(wm_class="error"),
        Match(wm_class="file_progress"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="notification"),
        Match(wm_class="splash"),
        Match(wm_class="ssh-askpass"),
        Match(wm_class="toolbar"),
    ],
    fullscreen_border_width=0,
    border_width=0,
    border_focus=colors["background_2"][0],
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
