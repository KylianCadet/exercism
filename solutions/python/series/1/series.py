def slices(series, length):
    if len(series) == 0:
        raise ValueError("series cannot be empty")
    if length == 0:
        raise ValueError("slice length cannot be zero")
    if length < 0:
        raise ValueError("slice length cannot be negative")
    if length > len(series):
        raise ValueError("slice length cannot be greater than series length")
    return [series[i:i+length] for i in range(0, len(series)) if len(series[i:i+length]) == length]
