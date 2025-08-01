from enum import Enum


class HandCategory(Enum):
    HIGH_CARD = 0
    ONE_PAIR = 1
    TWO_PAIR = 2
    THREE_OF_A_KIND = 3
    STRAIGHT = 4
    FLUSH = 5
    FULL_HOUSE = 6
    FOUR_OF_A_KIND = 7
    STRAIGHT_FLUSH = 8


class Suit(Enum):
    DIAMOND = 'D'
    CLUB = 'C'
    HEART = 'H'
    SPADE = 'S'


class Card:
    def __init__(self, card_repr, is_low_ace=False) -> None:
        *rank, suit = card_repr
        rank = ''.join(rank)
        self.card_repr = card_repr
        if rank in 'JQKA':
            rank = 11 + 'JQKA'.index(rank)
        self.rank = 1 if is_low_ace else int(rank)
        self.suit = Suit(suit)

    @property
    def is_ace(self) -> bool:
        return self.rank in [1, 14]

    def __lt__(self, other: 'Card') -> bool:
        return self.rank < other.rank

    def __repr__(self) -> str:
        return self.card_repr


class Hand:
    def __init__(self, cards: list[Card]) -> None:
        self.cards = cards

        if self.is_straight_with_ace():
            self.cards = [
                card if not card.is_ace else Card(card.card_repr, True) for card in self.cards]

        self.ranks = sorted(card.rank for card in self.cards)
        self.two = self.get_cards_of_same_rank(2)
        self.three = self.get_cards_of_same_rank(3)
        self.four = self.get_cards_of_same_rank(4)
        self.score = self.compute_score()

    def __repr__(self) -> str:
        return ' '.join(map(repr, self.cards))

    def __lt__(self, other: 'Hand') -> bool:
        return self.score < other.score

    def get_cards_of_same_rank(self, rank: int) -> list[Card]:
        return sort_cards_by_rank(card for card in self.cards if self.ranks.count(card.rank) == rank)

    def is_straight_with_ace(self) -> bool:
        ranks = sorted(1 if card.is_ace else card.rank for card in self.cards)
        return all([b-a == 1 for a, b in zip(ranks, ranks[1:])])

    @property
    def is_same_suit(self) -> bool:
        return all([self.cards[0].suit == card.suit for card in self.cards])

    @property
    def is_sequence(self) -> bool:
        return all([b-a == 1 for a, b in zip(self.ranks, self.ranks[1:])])

    @property
    def category(self) -> HandCategory:
        if self.is_same_suit and self.is_sequence:
            return HandCategory.STRAIGHT_FLUSH
        if len(self.four):
            return HandCategory.FOUR_OF_A_KIND
        if len(self.three) and len(self.two):
            return HandCategory.FULL_HOUSE
        if self.is_same_suit:
            return HandCategory.FLUSH
        if self.is_sequence:
            return HandCategory.STRAIGHT
        if len(self.three):
            return HandCategory.THREE_OF_A_KIND
        if len(self.two) == 4:
            return HandCategory.TWO_PAIR
        if len(self.two):
            return HandCategory.ONE_PAIR
        return HandCategory.HIGH_CARD

    def compute_score(self) -> tuple[int]:
        return (self.category.value, *[card.rank for card in self.sorted_cards])

    @property
    def sorted_cards(self) -> list[Card]:
        sorted_cards = [*self.four, *self.three, *self.two]
        other_cards = [card for card in self.cards if card not in sorted_cards]
        return [*sorted_cards, *sort_cards_by_rank(other_cards)]


def sort_cards_by_rank(cards: list[Card]) -> list[Card]:
    return [*sorted(cards, key=lambda card: card.rank, reverse=True)]


def best_hands(hands: list[str]) -> list[str]:
    *hands, = [Hand(list(map(Card, hand.split()))) for hand in hands]
    hands.sort(reverse=True)
    return [repr(hand) for hand in hands if hand.score == hands[0].score]
