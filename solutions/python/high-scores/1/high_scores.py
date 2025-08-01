class HighScores:
    def __init__(self, scores: list[int]):
        self._scores = scores or []
        pass

    def latest(self) -> int:
        return self._scores[-1]

    def personal_best(self) -> int:
        return max(self._scores)

    def personal_top_three(self) -> list[int]:
        return sorted(self._scores)[-3:][::-1]

    @property
    def scores(self) -> list[int]:
        return self._scores
