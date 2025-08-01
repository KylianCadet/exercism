days = [
    "first",
    "second",
    "third",
    "fourth",
    "fifth",
    "sixth",
    "seventh",
    "eighth",
    "ninth",
    "tenth",
    "eleventh",
    "twelfth"
]


def first_verse(day):
    return f"On the {days[day]} day of Christmas my true love gave to me: "


verses = [
    "twelve Drummers Drumming",
    "eleven Pipers Piping",
    "ten Lords-a-Leaping",
    "nine Ladies Dancing",
    "eight Maids-a-Milking",
    "seven Swans-a-Swimming",
    "six Geese-a-Laying",
    "five Gold Rings",
    "four Calling Birds",
    "three French Hens",
    "two Turtle Doves",
    "a Partridge in a Pear Tree."
]


def get_verses(verse_number: int) -> str:
    first = first_verse(verse_number - 1)
    verse = ', '.join(verses[::-1][0:verse_number][::-1])
    if verse_number > 1:
        verse = verse.replace('a Partridge', 'and a Partridge')
    return first + verse


def recite(start_verse: int, end_verse: int) -> list[str]:
    return [*map(get_verses, range(start_verse, end_verse + 1))]
