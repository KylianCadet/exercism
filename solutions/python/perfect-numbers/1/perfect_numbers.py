def classify(number: int) -> str:
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number < 1:
        raise ValueError(
            "Classification is only possible for positive integers.")

    aliquot_sum = sum(i for i in range(1, number) if number % i == 0)

    return {
        aliquot_sum == number: 'perfect',
        aliquot_sum > number: 'abundant',
        aliquot_sum < number: 'deficient'
    }[True]
