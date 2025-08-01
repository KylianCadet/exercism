def find(search_list: list[int], value: int):
    try:
        return search_list.index(value)
    except Exception as exc:
        raise ValueError("value not in array") from exc
