import re


def translate_word(word: str) -> str:
    if re.match(r'^(?:yt|xr)|[aeiou]', word) is not None:
        return word + 'ay'

    re_match = re.match(r'^(qu+)(.*)', word)
    if re_match:
        return re_match.group(2) + re_match.group(1) + 'ay'

    re_match = re.match(r'^([^aeiouy]+)(.*)', word)
    if re_match:
        if re_match.group(2).startswith('ua'):
            return re_match.group(2)[1:] + re_match.group(1) + 'uay'
        return re_match.group(2) + re_match.group(1) + 'ay'

    re_match = re.match(r'^([^aeiou]+)(.*)', word)
    if re_match:
        return re_match.group(2) + re_match.group(1) + 'ay'

    return word


def translate(text: str) -> str:
    return ' '.join(map(translate_word, text.split()))
