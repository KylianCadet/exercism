def response(hey_bob: str) -> str:
    is_question = hey_bob.strip().endswith('?')
    is_all_capital = hey_bob.isupper()
    is_silent = not hey_bob.strip()

    if is_question and is_all_capital:
        return 'Calm down, I know what I\'m doing!'
    if is_question:
        return 'Sure.'
    if is_silent:
        return 'Fine. Be that way!'
    if is_all_capital:
        return 'Whoa, chill out!'
    return 'Whatever.'
