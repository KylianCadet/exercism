"""Functions for creating, transforming, and adding prefixes to strings."""


def add_prefix_un(word: str) -> str:
    """Take the given word and add the 'un' prefix.

    :param word: str - containing the root word.
    :return: str - of root word prepended with 'un'.
    """

    return f'un{word}'


def make_word_groups(vocab_words: list[str]) -> str:
    """Transform a list containing a prefix and words into a string with the prefix
    followed by the words with prefix prepended.

    :param vocab_words: list - of vocabulary words with prefix in first index.
    :return: str - of prefix followed by vocabulary words with
            prefix applied.

    This function takes a `vocab_words` list and returns a string
    with the prefix and the words with prefix applied, separated
     by ' :: '.

    For example: list('en', 'close', 'joy', 'lighten'),
    produces the following string: 'en :: enclose :: enjoy :: enlighten'.
    """

    return ' :: '.join(
        word if index == 0 else f'{vocab_words[0]}{word}' for (index, word) in enumerate(vocab_words)
    )


def remove_suffix_ness(word: str) -> str:
    """Remove the suffix from the word while keeping spelling in mind.

    :param word: str - of word to remove suffix from.
    :return: str - of word with suffix removed & spelling adjusted.

    For example: "heaviness" becomes "heavy", but "sadness" becomes "sad".
    """

    new_word = word.removesuffix('ness')

    if new_word[-1] == 'i':
        return f'{new_word[:-1]}y'

    return new_word


def adjective_to_verb(sentence: str, index: int) -> str:
    """Change the adjective within the sentence to a verb.

    :param sentence: str - that uses the word in sentence.
    :param index: int - index of the word to remove and transform.
    :return: str - word that changes the extracted adjective to a verb.

    For example, ("It got dark as the sun set", 2) becomes "darken".
    """

    return f'{sentence.split(" ")[index].removesuffix(".")}en'
