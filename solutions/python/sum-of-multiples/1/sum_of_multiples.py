def sum_of_multiples(limit: int, multiples: list[int]) -> int:
    multiple_set = set()
    for i in range(limit):
        for multiple in filter(lambda x: x != 0, multiples):
            if i % multiple == 0:
                multiple_set.add(i)

    return sum(multiple_set)
