def is_paired(input_string):
    tokens = [('[', ']'), ('(', ')'), ('{', '}')]
    all_tokens = ''.join(a+b for a, b in tokens)

    input_string_filtered = ''.join(i for i in input_string if i in all_tokens)
    while any(_open+close in input_string_filtered for _open, close in tokens):
        for _open, close in tokens:
            if _open+close in input_string_filtered:
                input_string_filtered = input_string_filtered.replace(
                    _open+close, '')

    return len(input_string_filtered) == 0
