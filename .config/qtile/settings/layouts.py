from libqtile import layout
from libqtile.config import Match

from settings.constants import font
from settings.theme import colors

layout_configuration = {
    "border_width": 3,
    "single_margin": 0,
    "single_border_width": 0,
    "margin": 9,
    "border_focus": colors["background_soft"][0],
    "border_normal": colors["background_soft"][0],
    "font": font,
    # "grow_amount": 2,
}


layouts = [
    layout.Columns(
        border_on_single=True,
        num_columns=2,
        border_focus_stack=colors["background_soft"][0],
        border_normal_stack=colors["background_soft"][0],
        split=True,
        wrap_focus_columns=True,
        wrap_focus_rows=True,
        wrap_focus_stacks=True,
        **layout_configuration,
    ),
    layout.Max(**layout_configuration),
    # layout.Matrix(**layout_configuration),
    layout.MonadTall(**layout_configuration, ratio=0.60),
    # layout.MonadWide(**layout_configuration, ratio=0.60),
    # layout.Tile(**layout_configuration),
]

floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        Match(role="Dialog"),  # Firefox "Download file"
        Match(title="Choose ONE of the audio conference options"),  # Zoom
        Match(title="Open File"),
        Match(title="Polls", wm_class="zoom"),
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
        Match(wm_class=["qBittorrent" "qbittorrent"], title="Download from URLs"),
        Match(wm_type="dialog"),
        Match(wm_type="notification"),
        Match(wm_type="splash"),
        Match(wm_type="toolbar"),
        Match(wm_type="utility"),
        Match(
            wm_instance_class=["zoom "],
            title="Choose ONE of the audio conference options",
        ),
        Match(
            wm_instance_class=["zoom "],
            title="Meeting Alert",
        ),
        Match(
            wm_instance_class=["zoom "],
            title="Select a window or an application that you want to share",
        ),
    ],
    fullscreen_border_width=0,
    max_border_width=3,
    **layout_configuration,
    # border_focus=colors["background_soft"][0],
    # border_normal=colors["background_soft"][0],
)
