import functools
from typing import Union, TypeVar, Generic

T = TypeVar('T')


def chunks(arr: Generic[T], size: int) -> list[Generic[T]]:
    return [arr[index:index+size] for index in range(0, len(arr), size)]


SYMBOLS = "IVXLCDMVX"
GROUPED_SYMBOLS = chunks(SYMBOLS, 2)
GROUPED_SYMBOLS = [[*GROUPED_SYMBOLS[i], GROUPED_SYMBOLS[i+1][0]]
                   for i in range(len(GROUPED_SYMBOLS) - 1)]


def generate_roman_dict(unit_symbol, five_symbol, next_tenth_unit_symbol) -> dict:
    return {
        **dict(zip(range(1, 4), [unit_symbol*i for i in range(1, 4)])),
        4: unit_symbol + five_symbol,
        5: five_symbol,
        **dict(zip(range(6, 9), [five_symbol + unit_symbol*i for i in range(1, 4)])),
        9: unit_symbol + next_tenth_unit_symbol
    }


def get_tenth(number: int, index: int) -> Union[int, None]:
    """Get tenth digit based on the index
    get_tenth(678, 0) -> 8
    get_tenth(678, 1) -> 7
    get_tenth(678, 2) -> 6
    """
    try:
        return int(str(number)[::-1][index])
    except IndexError:
        return None


def roman(number: int) -> str:
    def roman_reducer(acc: str, value: tuple[int, list[str]]):
        index, symbols = value
        return acc + (generate_roman_dict(*symbols).get(get_tenth(number, len(GROUPED_SYMBOLS) - index - 1)) or '')

    return functools.reduce(roman_reducer, enumerate(GROUPED_SYMBOLS[::-1]), '')
