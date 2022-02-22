extends Node

var spell: SpellData = null

func _ready():
	name = spell.name
	icon = spell.icon
	randomize()

func execute():
	
