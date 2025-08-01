import itertools

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


def not_stop(strand: str) -> bool:
    return strand not in ['UAA', 'UAG', 'UGA']


def proteins(strand: str):
    group_len = 3
    sequence = [
        strand[i:i+group_len]
        for i in range(0, len(strand), group_len)
    ]
    sequence_trans = [
        protein_trans_table.get(strand_group)
        for strand_group in itertools.takewhile(not_stop, sequence)
    ]

    return sequence_trans
