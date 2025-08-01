score_trans_map = {
    **dict.fromkeys(['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'], 1),
    **dict.fromkeys(['D', 'G'], 2),
    **dict.fromkeys(['B', 'C', 'M', 'P'], 3),
    **dict.fromkeys(['F', 'H', 'V', 'W', 'Y'], 4),
    **dict.fromkeys(['K'], 5),
    **dict.fromkeys(['J', 'X'], 8),
    **dict.fromkeys(['Q', 'Z'], 10)
}


def get_letter_score(letter: str) -> int:
    return score_trans_map.get(letter)


def score(word: str) -> int:
    return sum(map(get_letter_score, word.upper()))
