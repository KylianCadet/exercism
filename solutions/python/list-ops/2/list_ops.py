import functools
from typing import Callable


def append(list1: list, list2: list) -> list:
    return [*list1, *list2]


def concat(lists: list[list]) -> list:
    return functools.reduce(lambda acc, list: acc + list, lists, [])


def filter(function: Callable, list: list) -> list:
    return [elem for elem in list if function(elem)]


def length(list: list) -> int:
    return len(list)


def map(function: Callable, list: list) -> list:
    return [function(elem) for elem in list]


def foldl(function: Callable, list: list, initial):
    return functools.reduce(function, list, initial)


def foldr(function: Callable, list: list, initial):
    return functools.reduce(function, list[::-1], initial)


def reverse(list: list):
    return list[::-1]
