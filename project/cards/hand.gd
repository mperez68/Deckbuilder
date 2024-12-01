extends CardStack
class_name Hand

const LIMIT = 6
@export var deck: Deck
@export var discard_pile: Discard

func _ready() -> void:
	insert(Card.CardName.MAGIC_MISSILE)
	insert(Card.CardName.MAGIC_MISSILE)
	insert(Card.CardName.MAGIC_MISSILE)
	insert(Card.CardName.GOBLIN)
	insert(Card.CardName.GOBLIN)
	insert(Card.CardName.GOBLIN)

func draw():
	insert(deck.draw())

func discard(card_index: int):
	discard_pile.insert(remove(card_index))

func _process(delta):
	super(delta)
	
	if cards.is_empty():
		return
	
	var width = 64+8
	var offset = -((cards.size() - 1) * width) / 2
	
	for i in cards.size():
		cards[i].position.x = offset + (i * width)
