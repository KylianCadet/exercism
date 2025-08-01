import random
from typing import Literal


def roll() -> Literal[1, 2, 3, 4, 5, 6]:
    return random.randint(1, 6)


class Character:
    ABILITIES: list[str] = ['strength', 'dexterity', 'constitution',
                            'intelligence', 'wisdom', 'charisma']

    @staticmethod
    def ability() -> int:
        return sum(sorted(roll() for _ in range(4))[1:])

    def __init__(self):
        for ability in self.ABILITIES:
            setattr(self, ability, self.ability())
        self.hitpoints = 10 + modifier(self.constitution)


def modifier(consitition: int) -> int:
    return (consitition - 10) // 2
