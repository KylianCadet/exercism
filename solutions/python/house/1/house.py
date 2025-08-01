verses = [
    'the horse and the hound and the horn that belonged to',
    'the farmer sowing his corn that kept',
    'the rooster that crowed in the morn that woke',
    'the priest all shaven and shorn that married',
    'the man all tattered and torn that kissed',
    'the maiden all forlorn that milked',
    'the cow with the crumpled horn that tossed',
    'the dog that worried',
    'the cat that killed',
    'the rat that ate',
    'the malt that lay in',
    'the house that Jack built.'
]


def recite_verse(verse_nb: int) -> str:
    return 'This is ' + ' '.join(verse for verse in verses[::-1][:verse_nb + 1][::-1])


def recite(start_verse: int, end_verse: int) -> list[str]:
    return [*map(recite_verse, range(start_verse - 1, end_verse))]
