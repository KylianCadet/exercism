number_to_string = {
    1: 'one',
    2: 'two',
    3: 'three',
    4: 'four',
    5: 'five',
    6: 'six',
    7: 'seven',
    8: 'eight',
    9: 'nine',
    10: 'ten'
}


def recite_number(number: int) -> str:
    return number_to_string.get(number) or 'no'


def recite_verse(number: int) -> list[str]:
    print(number, number > 2, f'bottle{"s" if number > 2 else ""}')
    return [
        *[f'{recite_number(number).title()} green bottle{"s" if number > 1 else ""} hanging on the wall,' for _ in range(2)],
        'And if one green bottle should accidentally fall,',
        f'There\'ll be {recite_number(number - 1)} green bottle{"s" if number != 2 else ""} hanging on the wall.'
    ]


def recite(start, take=1):
    retval = []
    for i in range(start, start - take, -1):
        retval += recite_verse(i)
        if i-1 != start - take:
            retval.append('')
    return retval
