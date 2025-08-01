def score(x: int, y: int) -> int:
    distance = (x**2 + y**2)**.5
    if distance <= 1:
        return 10
    if 1 < distance <= 5:
        return 5
    if 5 < distance <= 10:
        return 1
    return 0
