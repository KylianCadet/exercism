def transform(legacy_data: dict) -> dict:
    data = {}
    for key, values in legacy_data.items():
        for value in values:
            data.setdefault(value.lower(), key)
    return data
