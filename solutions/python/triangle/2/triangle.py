def equilateral(sides: list[int]) -> bool:
    return len(set(sides)) == 1 and sides[0] != 0


def isosceles(sides: list[int]) -> bool:
    return sides.count(max(sides)) >= 2


def scalene(sides: list[int]) -> bool:
    return len(set(sides)) == 3 and max(sides) <= sum(set(sides) - set([max(sides)]))
