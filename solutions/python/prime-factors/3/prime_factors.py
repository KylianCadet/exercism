def factors(value: int) -> list[int]:
    factor = 2
    prime_factors = []

    while value != 1:
        while value % factor == 0:
            value //= factor
            prime_factors.append(factor)
        factor += 1

    return prime_factors
