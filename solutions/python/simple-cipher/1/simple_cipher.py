from string import ascii_lowercase
from typing import Literal
import random
from operator import add, sub


class Cipher:
    key = None

    def __init__(self, key=None):
        self.key = key or self.generate_random_key()

    @staticmethod
    def generate_random_key() -> str:
        return ''.join(random.choices(ascii_lowercase, k=100))

    @staticmethod
    def shift_char(char: str, key: str, mode: Literal['left', 'right']) -> str:
        operator = add if mode == 'right' else sub
        return chr((operator((ord(char) - 97), (ord(key) - 97)) % 26) + 97)

    @staticmethod
    def shift_string(text: str, key: str, mode: Literal['left', 'right']) -> str:
        retval = ''
        for index, char in enumerate(text):
            retval += Cipher.shift_char(char,
                                        key[index % len(key)], mode)
        return retval

    def encode(self, text: str) -> str:
        return self.shift_string(text, self.key, 'right')

    def decode(self, text):
        return self.shift_string(text, self.key, 'left')
