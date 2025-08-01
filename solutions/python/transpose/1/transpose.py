from itertools import zip_longest
from typing import Union


def transpose(lines: str) -> str:
    def compute_tuple(values: tuple[Union[str, None]]) -> str:
        values: list[Union[str, None]] = list(values)
        while values[-1] is None:
            values.pop()

        return ''.join(value or ' ' for value in values)

    return '\n'.join(map(compute_tuple, zip_longest(*lines.split('\n'))))
