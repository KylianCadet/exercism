import functools


def generate_teen(number: int) -> str:
    return f'{numbers[number]}teen'


def generate_thenth(prefix: str, number: int) -> str:
    return f'{prefix}-{numbers[number]}'


numbers = {
    0: 'zero',
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten',
    11: 'eleven',
    12: 'twelve',
    13: 'thirteen',
    20: 'twenty',
    30: 'thirty',
    40: 'forty',
    50: 'fifty',
    60: 'sixty',
    70: 'seventy',
    80: 'eighty',
    90: 'ninety',
}


def generate_thenth_dict(number: int) -> dict:
    return dict(zip(range(number+1, number+10), map(lambda i: generate_thenth(numbers[number], i), range(1, 10))))


def merge_dicts(dicts: list[dict]) -> dict:
    return functools.reduce(lambda acc, value: {**acc, **value}, dicts, {})


numbers = {
    **numbers,
    **dict(zip(range(14, 20), map(generate_teen, range(4, 10)))),
    **merge_dicts(map(generate_thenth_dict, range(20, 100, 10)))
}


def chuncks(string: str, split_n: int) -> list[str]:
    return [string[i:i+split_n] for i in range(0, len(string), split_n)]


def rev(string: str):
    return string[::-1]


def say_group(group_number: str) -> str:
    hundredth, tenth, unit = map(int, group_number.rjust(3, '0'))
    if all(map(lambda x: x == 0, [hundredth, tenth, unit])):
        return numbers[0]

    hundredth = f"{numbers[hundredth]} hundred" if hundredth else None
    tenth = tenth * 10 + unit
    tenth = numbers[tenth] if tenth else None

    return ' '.join([str(group) for group in [hundredth, tenth] if group is not None])


SIZE = [None, 'thousand', 'million', 'billion']


def say(number: int) -> str:
    if not 0 <= number < 1000000000000:
        raise ValueError('input out of range')

    *groups, = map(rev, chuncks(str(number)[::-1], 3)[::-1])

    groups_str = []
    for index, group in enumerate(groups):
        suffix = SIZE[len(groups) - index - 1]
        group_str = say_group(group)
        # Case when having a 'zero' in the middle of the groups
        if group_str == numbers[0] and suffix is not None:
            continue
        # Case when having a 'zero' at the end, but having some results before, the 'zero' is absent
        if suffix is None and group_str == numbers[0] and len(groups_str) > 0:
            continue
        groups_str.append(group_str)
        if suffix:
            groups_str.append(suffix)

    return ' '.join(groups_str)
