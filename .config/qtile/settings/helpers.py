import re
import shlex
import subprocess

from libqtile.command import lazy

from settings.constants import keyboard_layouts


def switch_language():

    kb_layout_regex = re.compile(r"layout:\s+(?P<layout>\w+)")

    @lazy.function
    def __inner(qtile):
        cmd = "setxkbmap -verbose 10"
        pcmd = shlex.split(cmd)
        output = subprocess.check_output(pcmd).decode()

        match_layout = kb_layout_regex.search(output)
        kb = match_layout.group("layout")

        next_keyboard = keyboard_layouts[
            (keyboard_layouts.index(kb) + 1) % len(keyboard_layouts)
        ]

        subprocess.check_output(["setxkbmap", next_keyboard])

    return __inner
