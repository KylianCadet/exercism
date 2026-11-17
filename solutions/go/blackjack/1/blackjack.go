package blackjack



// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) int {
    var cards = map[string]int{
	    "ace": 11,
	    "two": 2,
	    "three": 3,
	    "four": 4,
	    "five": 5,
	    "six" : 6,
	    "seven": 7,
	    "eight": 8,
	    "nine": 9,
	    "ten": 10,
	    "jack": 10,
	    "queen": 10,
	    "king": 10,
	}
    
    value, ok := cards[card]
    if !ok {
        return 0
    }
    return value
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) string {
    playerValue := ParseCard(card1) + ParseCard(card2) 
    dealerValue := ParseCard(dealerCard)
    if playerValue == 22 {
        return "P"
    }
    if playerValue == 21 && dealerValue < 10 {
        return "W"
    }
    if playerValue >= 17 {
        return "S"
    }
    if playerValue >= 12 && playerValue <= 16 && dealerValue >= 7 {
        return "H"
    }
    if playerValue >= 12 && playerValue <= 16 {
        return "S"
    }
    return "H"
}
