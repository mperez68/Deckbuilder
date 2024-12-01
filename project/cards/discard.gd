extends CardStack
class_name Discard

func shuffleBack() -> Array:
	cards.shuffle()
	var ret = cards
	for card in cards:
		card.queue_free()
	cards = []
	return ret
