from typing import Union


def two_fer(name: Union[str, 'you'] = 'you') -> str:
    """Return "One for [name], one for me."

    Keyword Arguments:
        name -- name (default: {'you'})

    Returns:
        "One for [name], one for me."
    """
    return f'One for {name}, one for me.'
