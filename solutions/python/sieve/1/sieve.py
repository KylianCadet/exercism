def generate_prime_numbers():
    number = 2

    while (True):
        for i in range(2, number + 1 // 2):
            if number % i == 0:
                break
        else:
            yield number
        number += 1


def primes(limit: int) -> list[int]:
    prime_number_generator = generate_prime_numbers()
    retval = []

    while (value := next(prime_number_generator)) <= limit:
        retval.append(value)

    return retval
