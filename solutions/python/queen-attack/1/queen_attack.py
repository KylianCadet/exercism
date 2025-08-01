class Queen:
    def __init__(self, row: int, column: int) -> 'Queen':
        for value, _repr in [(row, 'row'), (column, 'column')]:
            if value < 0:
                raise ValueError(f'{_repr} not positive')
            if not 0 <= value <= 7:
                raise ValueError(f'{_repr} not on board')

        self._row = row
        self._column = column

    def __eq__(self, other: 'Queen') -> bool:
        return self.row == other.row and self.column == other.column

    def can_attack(self, another_queen: 'Queen') -> bool:
        if self == another_queen:
            raise ValueError(
                'Invalid queen position: both queens in the same square')

        return self.row == another_queen.row or \
            self.column == another_queen.column or \
            abs(self.row - another_queen.row) == abs(self.column - another_queen.column)

    @property
    def row(self) -> int:
        return self._row

    @property
    def column(self) -> int:
        return self._column
