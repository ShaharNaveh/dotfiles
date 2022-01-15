import subprocess

from libqtile import bar
from libqtile.config import Screen

from settings.constants import wallpaper
from settings.widgets import primary_widgets, secondary_widgets


def status_bar(widgets):
    return bar.Bar(
        widgets=widgets,
        size=24,
        margin=[0, 0, 0, 0],
    )


screens = [
    Screen(
        wallpaper=wallpaper.as_posix(),
        wallpaper_mode="fill",
        top=status_bar(primary_widgets),
        # bottom=bar.Gap(1),
        # left=bar.Gap(1),
        right=bar.Gap(1),
    ),
]

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
        screens.append(
            Screen(
                # top=status_bar(secondary_widgets),
                top=bar.Bar(widgets=secondary_widgets, size=30),
                wallpaper=wallpaper.as_posix(),
                wallpaper_mode="fill",
                right=bar.Gap(1),
            )
        )
