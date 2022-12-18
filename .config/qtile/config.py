from settings.constants import mod  # noqa: F401
from settings.layouts import (  # noqa: F401
    floating_layout,
    layouts,
)
from settings.mouse import mouse  # noqa: F401
from settings.screens import screens  # noqa: F401
from settings.widgets import (  # noqa: F401
    extension_defaults,
    widget_defaults,
)

from settings.keys import keys  # noqa: F401

from settings.groups import groups  # noqa: F401

# from libqtile import hook

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"


"""
@hook.subscribe.startup_once
def autostart():
    pass
"""
