"""Functions which helps the locomotive engineer to keep track of the train."""

import itertools


def get_list_of_wagons(*args):
    """Return a list of wagons.

    :param: arbitrary number of wagons.
    :return: list - list of wagons.
    """

    return [*args]


def fix_list_of_wagons(each_wagons_id: list[int], missing_wagons: list[int]) -> list[int]:
    """Fix the list of wagons.

    :parm each_wagons_id: list - the list of wagons.
    :parm missing_wagons: list - the list of missing wagons.
    :return: list - list of wagons.
    """

    while each_wagons_id[0] != 1:
        each_wagons_id.append(each_wagons_id.pop(0))

    each_wagons_id[1:1] = missing_wagons
    return each_wagons_id


def add_missing_stops(route: dict, **kwargs) -> dict:
    """Add missing stops to route dict.

    :param route: dict - the dict of routing information.
    :param: arbitrary number of stops.
    :return: dict - updated route dictionary.
    """

    return {**route, 'stops': [*kwargs.values()]}


def extend_route_information(route: dict, more_route_information: dict):
    """Extend route information with more_route_information.

    :param route: dict - the route information.
    :param more_route_information: dict -  extra route information.
    :return: dict - extended route information.
    """

    return {**route, **more_route_information}


def fix_wagon_depot(wagons_rows: list[list[tuple]]) -> list[list[tuple]]:
    """Fix the list of rows of wagons.

    :param wagons_rows: list[list[tuple]] - the list of rows of wagons.
    :return: list[list[tuple]] - list of rows of wagons.
    """

    new_list = [[] for _ in wagons_rows]

    for row in wagons_rows:
        for index, wagon in enumerate(row):
            new_list[index].append(wagon)

    return new_list
