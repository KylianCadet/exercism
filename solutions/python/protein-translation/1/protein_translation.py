protein_trans_table: dict[str, str] = {
    'AUG': 'Methionine',
    'UUU': 'Phenylalanine',
    'UUC': 'Phenylalanine',
    'UUA': 'Leucine',
    'UUG': 'Leucine',
    'UCU': 'Serine',
    'UCC': 'Serine',
    'UCA': 'Serine',
    'UCG': 'Serine',
    'UAU': 'Tyrosine',
    'UAC': 'Tyrosine',
    'UGU': 'Cysteine',
    'UGC': 'Cysteine',
    'UGG': 'Tryptophan',
    'UAA': 'STOP',
    'UAG': 'STOP',
    'UGA': 'STOP'
}


def proteins(strand: str):
    group_len = 3
    sequence = [
        protein_trans_table.get(strand[i:i+group_len])
        for i in range(0, len(strand), group_len)
    ]
    try:
        index = sequence.index('STOP')
        sequence = sequence[:index]
    except ValueError:
        pass

    return sequence
