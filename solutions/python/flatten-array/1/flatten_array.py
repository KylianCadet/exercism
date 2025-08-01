from typing import Any


def flatten(iterable: list[Any]) -> list[Any]:
    """Flatten an array

    Arguments:
        iterable -- array to flatten

    Returns:
        The flatten array
    """
    new_arr = []

    for elem in iterable:
        if isinstance(elem, list):
            new_arr[len(new_arr):] = flatten(elem)
        elif elem is not None:
            new_arr.append(elem)

    return new_arr
