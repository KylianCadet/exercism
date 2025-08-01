class Matrix:
    def __init__(self, matrix_string: str):
        *self._matrix, = map(lambda line: [*map(int,
                             line.split())], matrix_string.split('\n'))

    def row(self, index: int) -> list[int]:
        return self._matrix[index - 1]

    def column(self, index: int) -> list[int]:
        return list(list(zip(*self._matrix))[index - 1])
