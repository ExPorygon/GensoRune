extends Entity

class_name Battler

@export var stats : Resource

@onready var ai = $AI
@onready var actions = $Actions
@onready var Status_Label = $Status
@onready var spells = $Spells
@onready var active_spells = $Actions/Spell

var spell_action_scene = preload("res://SpellAction.tscn")
var isGuarding = false

func _ready():
	stats.reset()
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)
	init_spells(spells.get_children())

func init_spells(spells: Array) -> void:
	for spell in spells:
		var new_spell = spell_action_scene.instantiate()
		new_spell.spell = spell.spell
		actions.get_node("Spell").add_child(new_spell)

func _process(delta):
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)

func get_actions():
	return actions.get_children()
