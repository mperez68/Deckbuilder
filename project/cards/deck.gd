extends CardStack
class_name Deck

@export var discard: Discard

func draw() -> Card.CardName:
	if cards.is_empty():
		# shuffle discard back in to this deck
		cards = discard.shuffleBack()
	
	return remove(0)
