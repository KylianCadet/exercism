from typing import Union


def two_fer(name: Union[str, None] = None) -> str:
    """Return "One for [name], one for me." if name is defined else "One for you, one for me."

    Keyword Arguments:
        name -- name (default: {None})

    Returns:
        "One for [name], one for me." if name is defined else "One for you, one for me."
    """
    return f'One for {name or "you"}, one for me.'
