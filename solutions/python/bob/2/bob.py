def response(hey_bob: str) -> str:
    has_letter = any(char.isalpha() for char in hey_bob)
    is_question = hey_bob.strip().endswith('?')
    is_all_capital = all(char.isupper() for char in hey_bob if char.isalpha())
    is_silent = len([char for char in hey_bob if char.isalnum()]) == 0

    if is_question and is_all_capital and has_letter:
        return 'Calm down, I know what I\'m doing!'
    if is_question:
        return 'Sure.'
    if is_silent:
        return 'Fine. Be that way!'
    if is_all_capital and has_letter:
        return 'Whoa, chill out!'
    return 'Whatever.'
