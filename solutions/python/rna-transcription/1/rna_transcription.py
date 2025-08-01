def to_rna(dna_strand: str) -> str:
    """Compute the RNA complement of a given DNA sequence

    Arguments:
        dna_strand -- DNA sequence

    Returns:
        RNA sequence
    """
    dna_to_rna_dict = {
        'G': 'C',
        'C': 'G',
        'T': 'A',
        'A': 'U'
    }

    return ''.join(map(lambda char: dna_to_rna_dict[char], dna_strand))
