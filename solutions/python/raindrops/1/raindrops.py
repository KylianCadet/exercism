def convert(number: int) -> str:
    return ''.join(
        raindrop if number % value == 0 else ''
        for value, raindrop in [(3, 'Pling'), (5, 'Plang'), (7, 'Plong')]
    ) or str(number)
