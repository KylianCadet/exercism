import re
import functools


class Luhn:
    def __init__(self, card_num: str):
        self.card_num = card_num

    def valid(self) -> bool:
        if re.match(r'^[\d|\s]+$', self.card_num) is None:
            return False

        *card_num, = map(int, filter(str.isdigit, self.card_num))

        if len(card_num) <= 1:
            return False

        card_num = card_num[::-1]

        def luhn_sum(acc: int, value: tuple[int, int]) -> int:
            index, number = value

            def luhn_doubling(number: int) -> int:
                number *= 2
                return number if number < 10 else number - 9

            return acc + (number if index % 2 == 0 else luhn_doubling(number))

        return functools.reduce(luhn_sum, enumerate(card_num), 0) % 10 == 0
