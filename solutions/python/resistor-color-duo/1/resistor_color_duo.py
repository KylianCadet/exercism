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


def value(colors: list[str]):
    """Takes color names as input and output a two digit number, even if the input is more than two colors

    Arguments:
        colors -- List of color

    Returns:
        Value of the resistance based on the colors list
    """
    return int(''.join(map(lambda color: str(Color[color.upper()].value), colors[:2])))
