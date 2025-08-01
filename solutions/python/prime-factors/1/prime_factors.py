def generate_prime_numbers():
    number = 2
    while True:
        for i in range(2, number // 2):
            if number % i == 0:
                number += 1
                break
        else:
            yield number
            number += 1


def factors(value: int) -> list[int]:
    prime_number_generator = generate_prime_numbers()
    prime = next(prime_number_generator)
    print(prime)
    prime_factors = []

    while value != 1:
        while value % prime == 0:
            value //= prime
            prime_factors.append(prime)
        prime = next(prime_number_generator)
        print(prime)

    return prime_factors
