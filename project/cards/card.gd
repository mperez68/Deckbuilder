extends Node2D
class_name Card

# Enumerated Types
enum CardType{ SPELL, CREATURE }
enum CardName{ NONE, GOBLIN, MAGIC_MISSILE }
enum CardTargets{ ANY }

# Variables
@export var card: CardName
var card_name: String
var cost: int = 0
var power = -1
var health = -1
var type: CardType = CardType.SPELL
var effect = func foo(targets: Array):
	print("NO EFFECT GIVEN")
var target_flags: Array

func _ready():
	var card_data = readCardData(card)
	
	# Set Card Text
	card_name = card_data.get("name")
	$Title.text = card_name
	$Cost.text = String.num(card_data.get("cost"), 0)
	$Text.text = card_data.get("text")
	
	# Set Stats if Creature
	if (card_data.has("power") and card_data.has("health")):
		type = CardType.CREATURE
		power = String.num(card_data.get("power"), 0)
		$Power.text = power
		health = String.num(card_data.get("health"), 0)
		$Health.text = health
	
	# Set Targets/effect if valid
	if (card_data.has("effect") and card_data.has("targets")):
		target_flags = card_data.get("targets")
		setEffect(card_data.get("effect"))
	
	print("init card: ", self)
	#effect.call(["a", "b", "c"])

func _process(delta):
	pass

# Effects

func damage(targets: Array):
	print("damage effect -> ", targets)
	for target in targets:
		print("damaging ", target)

# Util

func readCardData(index: int):
	var json_file_path = "res://cards/card_data.txt"
	if FileAccess.file_exists(json_file_path):
		var file = FileAccess.open(json_file_path, FileAccess.READ)
		var content = file.get_as_text()
		var json = JSON.parse_string(content)
		return json[index]
	else:
		print("null file path")
		return null

func setEffect(eff: String) -> bool:
	match eff:
		"DAMAGE":
			effect = damage
			return true
		_:
			return false

func _to_string() -> String:
	return card_name + " (" + String.num(position.x) + ", " + String.num(position.y) + ")"
