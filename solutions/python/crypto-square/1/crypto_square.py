from math import ceil
from typing import Any
from itertools import zip_longest


def cipher_text(plain_text: str):
    def normalize(char: str):
        return char.isalnum() and not char.isspace()

    def chunks(arr: list[Any], chunk_size: int) -> list[list[Any]]:
        return [arr[i:i+chunk_size] for i in range(0, len(arr), chunk_size or 1)]

    normalized_text = ''.join(filter(normalize, plain_text.lower()))
    chunk_size = ceil(len(normalized_text)**.5)
    chunked_normalized_text = chunks(normalized_text, chunk_size)

    def tuple_to_str(value: tuple) -> str:
        return ''.join(value)

    return ' '.join(map(tuple_to_str, zip_longest(*chunked_normalized_text, fillvalue=' ')))
