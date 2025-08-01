from enum import Enum


class Color(Enum):
    """Color enum
    """
    BLACK = 0
    BROWN = 1
    RED = 2
    ORANGE = 3
    YELLOW = 4
    GREEN = 5
    BLUE = 6
    VIOLET = 7
    GREY = 8
    WHITE = 9


def color_code(color: str) -> int:
    """Get color code based on color name

    Arguments:
        color -- color name (eg: "grey", "white", ...)

    Returns:
        The color code
    """
    return Color[color.upper()].value


def colors() -> list[str]:
    """Return list of all available colors name

    Returns:
        List of all available colors name
    """
    return list(map(lambda color: color.name.lower(), Color))
