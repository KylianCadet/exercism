from itertools import count


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


def postponed_sieve():                   # postponed sieve, by Will Ness
    yield 2
    yield 3
    yield 5
    yield 7  # original code David Eppstein,
    sieve = {}  # Alex Martelli, ActiveState Recipe 2002
    ps = postponed_sieve()               # a separate base Primes Supply:
    p = next(ps) and next(ps)            # (3) a Prime to add to dict
    q = p*p                              # (9) its sQuare
    for c in count(9, 2):                 # the Candidate
        if c in sieve:               # c's a multiple of some base prime
            s = sieve.pop(c)  # i.e. a composite ; or
        elif c < q:
            yield c                 # a prime
            continue
        else:   # (c==q):            # or the next base prime's square:
            s = count(q+2*p, 2*p)  # (9+6, by 6 : 15,21,27,33,...)
            p = next(ps)  # (5)
            q = p*p  # (25)
        for m in s:                  # the next multiple
            if m not in sieve:       # no duplicates
                break
        sieve[m] = s                 # original test entry: ideone.com/WFv4f


def factors(value: int) -> list[int]:
    prime_number_generator = postponed_sieve()
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
