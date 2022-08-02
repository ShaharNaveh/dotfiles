import os
import pathlib

browser = os.getenv("BROWSER", "")
font = "FiraCode Nerd Font"
mod = "mod4"
terminal = os.getenv("TERMINAL", "")
theme = "custom"
keyboard_layouts = ["us", "il"]

_home = pathlib.Path.home()
wallpaper = _home / "Pictures" / "Wallpapers" / "dark_forest.png"
qtile_config_dir = _home / ".config" / "qtile"
icons_dir = qtile_config_dir / "icons"
