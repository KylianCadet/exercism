def distance(strand_a: str, strand_b: str) -> int:
    """Calculate the Hamming Distance between two DNA strands.

    Arguments:
        strand_a -- DNA strand a
        strand_b -- DNA strand b

    Raises:
        ValueError: Stands len are not equal

    Returns:
        Number of differences between the 2 strands
    """
    if len(strand_a) != len(strand_b):
        raise ValueError("Strands must be of equal length.")

    return sum(a != b for a, b in zip(strand_a, strand_b))
