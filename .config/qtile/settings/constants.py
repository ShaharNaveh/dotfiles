import pathlib

browser = "firefox"
font = "FiraCode Nerd Font"
mod = "mod4"
terminal = "alacritty"
theme = "custom"
keyboard_layouts = ["us", "il"]

wallpaper = (
    pathlib.Path.home()
    / "Pictures"
    / "Wallpapers"
    / "dark_forest.png"
)


qtile_config_dir = pathlib.Path.home() / ".config" / "qtile"

icons_dir = qtile_config_dir / "icons"
