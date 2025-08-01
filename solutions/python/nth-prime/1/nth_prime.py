def prime_generator():
    number = 2

    while True:
        for i in range(2, int(number**.5 + 1)):
            if number % i == 0:
                break
        else:
            yield number
        number += 1


def prime(number):
    if number == 0:
        raise ValueError("there is no zeroth prime")

    gen = prime_generator()
    for _ in range(number):
        prime = next(gen)

    return prime
