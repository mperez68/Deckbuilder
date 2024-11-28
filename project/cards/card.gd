extends Node2D

enum CardType{ SPELL, CREATURE }
enum TargetFlags{ ANY }
enum CardName{ NONE, MAGIC_MISSILE, GOBLIN }

# Variables
@export var card_name: CardName
var cost: int = 0
var type: CardType = CardType.CREATURE
var effect = func foo(targets: Array):
	pass
var target_flags: Array

# Called when the node enters the scene tree for the first time.
func _ready():
	var card_data = readCardData(card_name)
	$Title.text = card_data.get("name")
	$Cost.text = String.num(card_data.get("cost"), 0)
	$Text.text = card_data.get("text")
	if (card_data.has("power") and card_data.has("health")):
		$Power.text = String.num(card_data.get("power"), 0)
		$Health.text = String.num(card_data.get("health"), 0)

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
