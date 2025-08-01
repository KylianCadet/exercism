from collections import Counter
from string import ascii_lowercase


def is_isogram(string: str) -> bool:
    """Determine if the string is an isogram.

    An isogram (also known as a "non-pattern word") is a word or phrase without a repeating letter.
    However spaces and hyphens are allowed to appear multiple times.

    Arguments:
        string -- the string to determine.

    Returns:
        Is the string an isogram.
    """
    return all(value == 1 for value in Counter([char for char in string.lower() if char in ascii_lowercase]).values())
