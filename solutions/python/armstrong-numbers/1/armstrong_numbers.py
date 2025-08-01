def is_armstrong_number(number):
    number_len = len(str(number))

    return number == sum(map(lambda n: int(n)**number_len, str(number)))
