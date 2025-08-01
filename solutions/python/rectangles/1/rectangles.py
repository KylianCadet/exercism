import itertools

CORNER = '+'
X_LINE = '-'
Y_LINE = '|'


class Point():
    def __init__(self, x, y) -> None:
        self.x = x
        self.y = y

    def __repr__(self) -> str:
        return f'{self.__class__.__name__}({self.x}, {self.y})'

    def __eq__(self, other) -> bool:
        return self.x == other.x and self.y == other.y


def rectangles(strings: list[str]) -> int:
    rectangle_count = 0
    corners: list[Point] = []
    for y, row in enumerate(strings):
        for x, col in enumerate(row):
            if col == CORNER:
                corners.append(Point(x, y))

    for corner in corners:
        y_corners = [c for c in corners if c.y == corner.y and c.x > corner.x]
        x_corners = [c for c in corners if c.x == corner.x and c.y > corner.y]

        for y_corner, x_corner in itertools.product(y_corners, x_corners):
            last_corner = Point(y_corner.x, x_corner.y)
            if last_corner not in corners:
                continue

            first_row = strings[corner.y][corner.x:last_corner.x]
            last_row = strings[last_corner.y][corner.x:last_corner.x]
            cols = list(map(list, zip(*strings)))
            first_col = cols[corner.x][corner.y:last_corner.y]
            last_col = cols[last_corner.x][corner.y:last_corner.y]

            if any(char not in [X_LINE, CORNER] for char in first_row+last_row):
                continue

            if any(char not in [Y_LINE, CORNER] for char in first_col+last_col):
                continue

            rectangle_count += 1

    return rectangle_count
