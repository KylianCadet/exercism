from string import ascii_uppercase


def rows(letter: str) -> list[str]:
    retval = []
    index = ascii_uppercase.index(letter)
    for i in range(index+1):
        retval.append(" "*(index-i) +
                      ascii_uppercase[i] +
                      (" "*((i-1)*2+1) if i != 0 else "") +
                      (ascii_uppercase[i] if i != 0 else "") +
                      " "*(index-i))
    retval += retval[::-1][1:]
    return retval
