import collections


def clean_word(word: str) -> str:
    return word.strip("'")


def clean_sentence(sentence: str) -> str:
    sentence = sentence.replace('_', ' ').replace(',', ' ').replace(':', ' ')
    return ''.join(filter(lambda char: char.isalnum() or char.isspace() or char == "'", sentence)).lower()


def count_words(sentence: str) -> dict[str, int]:
    return dict(collections.Counter(map(clean_word, clean_sentence(sentence).split())))
