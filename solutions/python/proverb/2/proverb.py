def not_none(value) -> bool:
    return value is not None


def proverb(*args, qualifier=None) -> str:
    lines = [f"For want of a {name1} the {name2} was lost." for name1,
             name2 in zip(args, args[1:])]

    if len(args) > 0:
        last_name = args[0] if qualifier is None else f"{qualifier} {args[0]}"
        lines.append(f"And all for the want of a {last_name}.")

    return lines
