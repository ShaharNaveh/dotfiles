from libqtile import bar, widget

from settings.theme import colors

# NOTE: The icons are from https://www.nerdfonts.com/cheat-sheet

GROUPBOX_SETTINGS = {
    "padding": 5,
    "borderwidth": 4,
    "active": colors["white"],
    "inactive": colors["grey"],
    "disable_drag": True,
    "rounded": True,
    "highlight_color": colors["background_soft"],
    "block_highlight_text_color": colors["blue"],
    "highlight_method": "block",
    "this_current_screen_border": colors["background_hard"],
    "this_screen_border": colors["magenta"],
    "other_current_screen_border": colors["background_hard"],
    "other_screen_border": colors["background_hard"],
    "foreground": colors["foreground"],
    "background": colors["background_hard"],
    "urgent_border": colors["red"],
}

widget_defaults = {
    "background": colors["background"],
    "font": "FiraCode Nerd Font",
    "fontsize": 14,
    "padding": 3,
}

extension_defaults = widget_defaults.copy()


primary_widgets = [
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.GroupBox(
        visible_groups=[
            "WWW",
        ],
        **GROUPBOX_SETTINGS,
    ),
    widget.GroupBox(
        visible_groups=["DOC", "CODE", "SYS", "MSG"],
        **GROUPBOX_SETTINGS,
    ),
    widget.GroupBox(
        visible_groups=["VBOX"],
        **GROUPBOX_SETTINGS,
    ),
    widget.GroupBox(
        visible_groups=["ZOOM"],
        **GROUPBOX_SETTINGS,
    ),
    widget.GroupBox(
        visible_groups=["TORRENT"],
        **GROUPBOX_SETTINGS,
    ),
    widget.GroupBox(
        visible_groups=["SETTINGS"],
        **GROUPBOX_SETTINGS,
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.Sep(
        linewidth=0,
        foreground=colors["background_soft"],
        background=colors["background"],
        padding=10,
        size_percent=40,
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.CurrentLayoutIcon(
        foreground=colors["background_soft"],
        background=colors["background_hard"],
        # padding=-10,
        scale=0.40,
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.Spacer(),
    widget.TextBox(
        text=" ",
        foreground=colors["cyan_hard"],
        background=colors["background"],
        font="Font Awesome 5 Free Solid",
    ),
    widget.WindowName(
        background=colors["background"],
        foreground=colors["cyan_hard"],
        width=bar.CALCULATED,
        empty_group_string="Desktop",
        max_chars=30,
        # mouse_callbacks={"Button2": kill_window},
    ),
    widget.Spacer(),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.TextBox(
        text=" ",
        foreground=colors["cyan"],
        background=colors["background_hard"],
    ),
    widget.PulseVolume(
        foreground=colors["cyan"],
        background=colors["background_hard"],
        limit_max_volume="True",
        # mouse_callbacks={"Button3": open_pavu},
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.Sep(
        linewidth=0,
        foreground=colors["background_soft"],
        padding=10,
        size_percent=50,
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.TextBox(
        text=" ",
        font="Font Awesome 5 Free Solid",
        foreground=colors["yellow"],
        background=colors["background_hard"],
    ),
    widget.Clock(
        format="%a, %b %d",
        background=colors["background_hard"],
        foreground=colors["yellow"],
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.Sep(
        linewidth=0,
        foreground=colors["background_soft"],
        padding=10,
        size_percent=50,
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
    widget.TextBox(
        text=" ",
        font="Font Awesome 5 Free Solid",
        foreground=colors["green"],
        background=colors["background_hard"],
    ),
    widget.Clock(
        format="%H:%M",
        foreground=colors["green"],
        background=colors["background_hard"],
        #    mouse_callbacks={"Button1": todays_date},
    ),
    widget.TextBox(
        text="",
        foreground=colors["background_hard"],
        background=colors["background"],
        fontsize=14,
        padding=0,
    ),
]


secondary_widgets = []
