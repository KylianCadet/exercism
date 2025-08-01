"""Functions to help Azara and Rui locate pirate treasure."""

from typing import Tuple, Union


def get_coordinate(record: Tuple[str, str]) -> str:
    """Return coordinate value from a tuple containing the treasure name, and treasure coordinate.

    :param record: tuple - with a (treasure, coordinate) pair.
    :return: str - the extracted map coordinate.
    """

    return record[1]


def convert_coordinate(coordinate: str) -> Tuple[int, int]:
    """Split the given coordinate into tuple containing its individual components.

    :param coordinate: str - a string map coordinate
    :return: tuple - the string coordinate split into its individual components.
    """

    return (coordinate[0], coordinate[1])


def compare_records(azara_record: Tuple[str, str], rui_record: Tuple[str, Tuple[str, str], str]) -> bool:
    """Compare two record types and determine if their coordinates match.

    :param azara_record: tuple - a (treasure, coordinate) pair.
    :param rui_record: tuple - a (location, tuple(coordinate_1, coordinate_2), quadrant) trio.
    :return: bool - do the coordinates match?
    """

    return azara_record[1] == rui_record[1][0] + rui_record[1][1]


def create_record(azara_record: Tuple[str, str], rui_record: Tuple[str, Tuple[str, str], str]) -> Union[Tuple[str, str, str, Tuple[str, str], str], str]:
    """Combine the two record types (if possible) and create a combined record group.

    :param azara_record: tuple - a (treasure, coordinate) pair.
    :param rui_record: tuple - a (location, coordinate, quadrant) trio.
    :return: tuple or str - the combined record (if compatible), or the string "not a match" (if incompatible).
    """

    if not compare_records(azara_record, rui_record):
        return 'not a match'
    return azara_record + rui_record


def clean_up(combined_record_group: list[Tuple[str, str, str, Tuple[str, str], str]]):
    """Clean up a combined record group into a multi-line string of single records.

    :param combined_record_group: tuple - everything from both participants.
    :return: str - everything "cleaned", excess coordinates and information are removed.

    The return statement should be a multi-lined string with items separated by newlines.

    (see HINTS.md for an example).
    """

    def format_tuple(record: Tuple[str, str, str, Tuple[str, str], str]) -> str:
        return f"('{record[0]}', '{record[2]}', ('{record[3][0]}', '{record[3][1]}'), '{record[4]}')"

    return '\n'.join(map(format_tuple, combined_record_group)) + '\n'
