def steps(number: int) -> int:
    if number <= 0:
        raise ValueError("Only positive integers are allowed")

    step = 0
    while number != 1:
        if number % 2:
            number *= 3
            number += 1
        else:
            number //= 2
        step += 1
    return step
