from enum import Enum
import re


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


def get_color_value(color_name: str) -> int:
    return Color[color_name.upper()].value


def label(colors: list[str]) -> str:
    a, b, c, *other = map(get_color_value, colors)
    omh = (a*10+b)*10**c
    zero_groups = len(re.findall(r'0{3}', str(omh)[::-1]))
    omh = omh // (10 ** (3 * zero_groups))

    return f"{omh} {['ohms', 'kiloohms', 'megaohms', 'gigaohms'][zero_groups]}"
