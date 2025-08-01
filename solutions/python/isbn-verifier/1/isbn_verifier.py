import re


def is_valid(isbn: str) -> bool:
    if re.match(r'^[\d-]*[X]?$', isbn) is None:
        return False

    parsed_isbn = isbn.replace('-', '')

    if len(parsed_isbn) != 10:
        return False

    return sum(
        10 if parsed_isbn[i] == 'X' else int(parsed_isbn[i]) * (10 - i)
        for i in range(10)
    ) % 11 == 0
