import itertools


def triplets_with_sum(n: int) -> list[list[int]]:
    triplets = []
    for a in range(1, n//3 + 1):
        b = (n**2 - 2 * a * n) // (2 * (n - a))
        c = n - a - b

        if a**2 + b**2 == c**2 and b > 0 and c > 0 and [b, a, c] not in triplets:
            triplets.append([a, b, c])

    return triplets
