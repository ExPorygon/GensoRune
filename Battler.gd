extends Entity

class_name Battler

export var stats : Resource

onready var ai = $AI
onready var actions = $Actions
onready var Status_Label = $Status
var isGuarding = false

func _ready():
	stats.reset()
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)

func _process(delta):
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)

func get_actions():
	return actions.get_children()
