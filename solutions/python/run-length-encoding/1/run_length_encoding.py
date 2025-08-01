import re
from typing import Iterator, Match


def decode(string: str) -> str:
    decoder = re.compile(r'(\d*[a-zA-Z\s])')
    tokens = decoder.findall(string)

    retval = ''
    for *digits, char in tokens:
        retval += (char * int(''.join(digits) or 1))

    return retval


def encode(string: str) -> str:
    encoder = re.compile(r'(\w|\s)\1*')
    tokens: Iterator[Match[str]] = encoder.finditer(string)
    tokens: list[str] = [token.group() for token in tokens]

    def format_token(token: str) -> str:
        return f'{len(token) if len(token) > 1 else ""}{token[0]}'

    return (''.join(map(format_token, tokens)))
