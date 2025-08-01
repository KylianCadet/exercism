def not_none(value) -> bool:
    return value is not None


def proverb(*args, qualifier=None) -> str:
    main = [f"For want of a {name1} the {name2} was lost." for name1,
            name2 in zip(args, args[1:])]

    last_name = ' '.join(
        filter(not_none, [qualifier, args[0] if len(args) > 0 else None]))
    last = f"And all for the want of a {last_name}."

    return [*main, last] if len(args) > 0 else []
