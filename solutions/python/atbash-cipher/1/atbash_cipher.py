from string import ascii_lowercase

atbash_cipher_trans_table = str.maketrans(
    ascii_lowercase, ascii_lowercase[::-1])


def chunk(string: str, n: int) -> list[str]:
    return [string[i:i+n] for i in range(0, len(string), n)]


def encode(plain_text: str) -> str:
    translated = ''.join(char for char in plain_text if char.isalnum()).lower(
    ).translate(atbash_cipher_trans_table)

    return ' '.join(chunk(translated, 5))


def decode(ciphered_text: str) -> str:
    return ciphered_text.replace(' ', '').translate(atbash_cipher_trans_table)
