import operator


def answer(question: str):
    print(question)
    if question.startswith('Who'):
        raise ValueError("unknown operation")

    if not question.startswith('What is ') or not question.endswith('?'):
        raise ValueError("syntax error")

    question = question.removeprefix('What is ')
    question = question.removesuffix('?')
    question = question.replace('plus', '+')
    question = question.replace('minus', '-')
    question = question.replace('multiplied by', '*')
    question = question.replace('divided by', '/')

    if any(unknown_operator in question for unknown_operator in ['cubed']):
        raise ValueError("unknown operation")

    if any(not char.removeprefix('-').isdigit() and char not in '+-*/' for char in question.split(' ')):
        raise ValueError("syntax error")

    operator_map = {
        '+': operator.add,
        '-': operator.sub,
        '*': operator.mul,
        '/': operator.floordiv
    }
    operator_fn = operator.add
    value, *other = question.split(' ')

    try:
        if len(other) == 0:
            return int(value)
        response = int(value)

        if response is None:
            raise ValueError("syntax error")

        while True:
            operator_str, value, *other = other
            operator_fn = operator_map.get(operator_str)
            if operator_fn is None:
                raise ValueError("syntax error")
            value = int(value)
            response = operator_fn(response, value)
            if len(other) == 0:
                break
    except Exception as exc:
        raise ValueError("syntax error") from exc

    return response
