extends Node

class_name SpellAction

var spell: SpellData = null

func _ready():
	name = spell.name
	#icon = spell.icon
	randomize()

func execute():
	pass
