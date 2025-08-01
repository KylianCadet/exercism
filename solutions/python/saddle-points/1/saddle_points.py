def saddle_points(matrix: list[list[int]]) -> list[object]:
    if not all(len(row) == len(matrix[0]) for row in matrix):
        raise ValueError('irregular matrix')

    rows = matrix
    *cols, = map(list, zip(*rows))
    retval = []

    for y, row in enumerate(rows):
        for x, col in enumerate(cols):
            if min(col) == col[y] and max(row) == row[x]:
                retval.append({'column': x+1, 'row': y+1})

    return retval
