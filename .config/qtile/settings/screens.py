from libqtile import bar
from libqtile.config import Screen

from settings.widgets import primary_widgets


def status_bar(widgets):
    return bar.Bar(widgets, 24)


screens = [Screen(top=status_bar(primary_widgets))]
