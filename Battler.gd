extends Entity

class_name Battler

export var stats : Resource

onready var Status_Label = $Status

func _ready():
	stats.reset()
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)

