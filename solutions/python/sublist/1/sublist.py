"""
This exercise stub and the test suite contain several enumerated constants.

Enumerated constants can be done with a NAME assigned to an arbitrary,
but unique value. An integer is traditionally used because it’s memory
efficient.
It is a common practice to export both constants and functions that work with
those constants (ex. the constants in the os, subprocess and re modules).

You can learn more here: https://en.wikipedia.org/wiki/Enumerated_type
"""

from typing import Any

SUBLIST = 1
SUPERLIST = 2
EQUAL = 3
UNEQUAL = 4


def is_orderded_sublist(list_one: list[Any], list_two: list[Any]) -> bool:
    if len(list_one) == 0 and len(list_two) > 0:
        return True

    for index, value in enumerate(list_two):
        if list_one[0] == value:
            if list_one == list_two[index:index+len(list_one)]:
                return True

    return False


def sublist(list_one: list[Any], list_two: list[Any]):
    return {
        is_orderded_sublist(list_two, list_one): SUPERLIST,
        is_orderded_sublist(list_one, list_two): SUBLIST,
        list_one == list_two: EQUAL
    }.get(True) or UNEQUAL
