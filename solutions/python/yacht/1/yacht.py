import collections
import enum


class YatchEnum(enum.Enum):
    YACHT = enum.auto()
    ONES = enum.auto()
    TWOS = enum.auto()
    THREES = enum.auto()
    FOURS = enum.auto()
    FIVES = enum.auto()
    SIXES = enum.auto()
    FULL_HOUSE = enum.auto()
    FOUR_OF_A_KIND = enum.auto()
    LITTLE_STRAIGHT = enum.auto()
    BIG_STRAIGHT = enum.auto()
    CHOICE = enum.auto()


# Only for testing purposes
YACHT = YatchEnum.YACHT
ONES = YatchEnum.ONES
TWOS = YatchEnum.TWOS
THREES = YatchEnum.THREES
FOURS = YatchEnum.FOURS
FIVES = YatchEnum.FIVES
SIXES = YatchEnum.SIXES
FULL_HOUSE = YatchEnum.FULL_HOUSE
FOUR_OF_A_KIND = YatchEnum.FOUR_OF_A_KIND
LITTLE_STRAIGHT = YatchEnum.LITTLE_STRAIGHT
BIG_STRAIGHT = YatchEnum.BIG_STRAIGHT
CHOICE = YatchEnum.CHOICE


def score(dice: list[int], category: YatchEnum) -> int:
    for index, _category in enumerate([
            YatchEnum.ONES,
            YatchEnum.TWOS,
            YatchEnum.THREES,
            YatchEnum.FOURS,
            YatchEnum.FIVES,
            YatchEnum.SIXES]):
        if _category == category:
            return sum(filter(lambda score: score == index + 1, dice))

    if category == YatchEnum.FULL_HOUSE:
        return sum(dice) if sorted(collections.Counter(dice).values()) == [2, 3] else 0

    if category == YatchEnum.CHOICE:
        return sum(dice)

    if category == YatchEnum.FOUR_OF_A_KIND:
        faces = set(key for key, value in collections.Counter(
            dice).items() if value >= 4)

        if len(faces) == 0:
            return 0

        face = faces.pop()

        return face * 4

    if category == YatchEnum.LITTLE_STRAIGHT:
        return 30 if sorted(dice) == [1, 2, 3, 4, 5] else 0

    if category == YatchEnum.BIG_STRAIGHT:
        return 30 if sorted(dice) == [2, 3, 4, 5, 6] else 0

    if category == YatchEnum.YACHT:
        return 50 if list(collections.Counter(dice).values()) == [5] else 0
