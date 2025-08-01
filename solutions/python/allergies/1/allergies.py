import enum
import functools


class Allergen(enum.Enum):
    EGGS = 0
    PEANUTS = 1
    SHELLFISH = 2
    STRAWBERRIES = 3
    TOMATOES = 4
    CHOCOLATE = 5
    POLLEN = 6
    CATS = 7


class Allergies:
    def __init__(self, score: int):
        self.score = score

    def allergic_to(self, item: str) -> bool:
        return item in self.lst

    @property
    def lst(self) -> list[str]:
        def lst_reducer(acc: list[str], value: tuple[int, str]) -> list[str]:
            index, bit = value
            if bit == '1':
                try:
                    acc.append(Allergen(index).name.lower())
                except ValueError:
                    return acc
            return acc

        binary_repr = bin(self.score)[2:]
        return functools.reduce(lst_reducer, enumerate(binary_repr[::-1]), [])
