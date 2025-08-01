from enum import Enum

metrics = {
    10e5: 'mega',
    10e2: 'kilo'
}


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


class Tolerance(Enum):
    """Tolerance enum
    """
    GREY = .05
    VIOLET = .1
    BLUE = .25
    GREEN = .5
    BROWN = 1
    RED = 2
    GOLD = 5
    SILVER = 10


def resistor_label(colors: list[str]):
    if len(colors) == 1 and colors[0] == 'black':
        return '0 ohms'
    if len(colors) < 3:
        raise ValueError('Not enough colours')

    *colors, tolerance = colors
    values = list(map(lambda color: Color[color.upper()].value, colors))
    tolerance = Tolerance[tolerance.upper()].value
    *values, multipler = values
    value = int(''.join(map(str, values)))
    value *= 10 ** multipler
    metric_prefix = ''
    for key, prefix in metrics.items():
        if value >= key:
            metric_prefix = prefix
            value /= key

    pretty_value = f'{value:.2f}'.rstrip('0').rstrip('.')
    return f'{pretty_value} {metric_prefix}ohms ±{tolerance}%'
