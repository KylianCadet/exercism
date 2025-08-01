def replace_all(s: str, tokens: list[str], new: str) -> str:
    for i in tokens:
        s = s.replace(i, new)

    return s


class PhoneNumber:
    def __init__(self, number: str):
        self._number = replace_all(
            number, ['(', ')', ' ', '-', '+', '.'], '')

        if len(self._number) < 10:
            raise ValueError("must not be fewer than 10 digits")
        if len(self._number) > 11:
            raise ValueError("must not be greater than 11 digits")
        if len(self._number) == 11 and self._number[0] != '1':
            raise ValueError("11 digits must start with 1")
        if len(self._number) == 11:
            self._number = self._number.removeprefix('1')
        if self._number[3] == '0':
            raise ValueError("exchange code cannot start with zero")
        if self._number[3] == '1':
            raise ValueError("exchange code cannot start with one")
        if self._number[0] == '0':
            raise ValueError("area code cannot start with zero")
        if self._number[0] == '1':
            raise ValueError("area code cannot start with one")
        if any(map(lambda x: not x.isalnum(), self._number)):
            raise ValueError("punctuations not permitted")
        if any(map(str.isalpha, self._number)):
            raise ValueError("letters not permitted")

    @property
    def number(self) -> str:
        return self._number

    @property
    def area_code(self) -> str:
        return self._number[0:3]

    @property
    def exchange_code(self) -> str:
        return self._number[3:6]

    @property
    def subscriber_number(self) -> str:
        return self._number[6:10]

    def pretty(self) -> str:
        return f'({self.area_code})-{self.exchange_code}-{self.subscriber_number}'
