from string import ascii_lowercase


def is_pangram(sentence: str) -> bool:
    """Is the sentence a pangram

    A pangram is a sentence using every letter of the alphabet at least once.

    Arguments:
        sentence -- sentence to determine

    Returns:
        True if the sentence is a pangram else False
    """

    return len(set(char for char in sentence.lower() if char in ascii_lowercase)) == len(ascii_lowercase)
