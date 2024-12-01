extends Node2D
class_name CardStack

const C = preload("res://cards/card.tscn")

@export var custom_scale = 1.0

var cards: Array

func insert(card: Card.CardName):
	var new_card = C.instantiate()
	new_card.card = card
	cards.push_front(new_card)
	add_child(new_card)

func remove(card_index: int) -> Card.CardName:
	var target = cards[card_index].card
	cards[card_index].queue_free()
	return target

func shuffle():
	cards.shuffle()

func _process(delta: float) -> void:
	scale = Vector2(custom_scale, custom_scale)
