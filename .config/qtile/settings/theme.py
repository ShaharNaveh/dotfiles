import json

from settings.constants import qtile_config_dir, theme


def load_theme() -> dict:
    theme_file_path = qtile_config_dir / "themes" / theme
    theme_file = theme_file_path.with_suffix(".json")

    if not theme_file.is_file():
        raise FileNotFoundError(f"{theme_file} does not exist")

    with theme_file.open(mode="r") as file_obj:
        json_contents = file_obj.read()

    return json.loads(json_contents)


if __name__ == "settings.theme":
    colors = load_theme()
