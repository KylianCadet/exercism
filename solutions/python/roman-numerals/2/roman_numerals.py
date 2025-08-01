def generate_roman_dict(unit_symbol, five_symbol, next_tenth_symbol) -> dict:
    return {
        **dict(zip(range(1, 4), [unit_symbol*i for i in range(1, 4)])),
        4: unit_symbol + five_symbol,
        5: five_symbol,
        **dict(zip(range(6, 9), [five_symbol + unit_symbol*i for i in range(1, 4)])),
        9: unit_symbol + next_tenth_symbol
    }


GROUPED_SYMBOLS = [
    'IVX'
    'XLC',
    'CDM',
    'MVX'
]


def unit(number: int) -> str:
    return generate_roman_dict('I', 'V', 'X').get(number % 10//1) or ''


def tenth(number: int) -> str:
    return generate_roman_dict('X', 'L', 'C').get(number % 100//10) or ''


def hundreth(number: int) -> str:
    return generate_roman_dict('C', 'D', 'M').get(number % 1000//100) or ''


def thousandth(number: int) -> str:
    return generate_roman_dict('M', 'V', 'X').get(number % 10000//1000) or ''


def roman(number: int) -> str:
    for index, symbols in enumerate(GROUPED_SYMBOLS):
        tenth = len(GROUPED_SYMBOLS) // (index + 1)
        a = generate_roman_dict(*symbols).get(number %
                                              tenth // tenth // 10) or ''
        print(a)
