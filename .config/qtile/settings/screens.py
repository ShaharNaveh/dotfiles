import subprocess

from libqtile import bar
from libqtile.config import Screen

# from settings.widgets import secondary_widgets
from settings.widgets import primary_widgets


def status_bar(widgets):
    return bar.Bar(widgets, 24)


screens = [Screen(top=status_bar(primary_widgets))]


"""
# For multi monitor support
connected_monitors = (
    subprocess.run(
        "xrandr | grep 'connected' | cut -d ' ' -f 2",
        shell=True,
        stdout=subprocess.PIPE,
    )
    .stdout.decode("UTF-8")
    .split("\n")[:-1]
    .count("connected")
)

if connected_monitors > 1:
    for _ in range(1, connected_monitors):
        screens.append(Screen(top=status_bar(secondary_widgets)))
"""
