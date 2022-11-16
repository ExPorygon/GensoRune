extends Entity

class_name Battler

signal defeated
signal damaged

@export var stats : Resource

@onready var ai = $AI
@onready var actions = $Actions
@onready var Status_Label = $Status
@onready var spells = $Spells
@onready var active_spells = $Actions/Spell
@onready var Console: Console
@onready var Game = get_tree().get_root().get_node_or_null("Game")

var alive := true
var spell_action_scene = preload("res://SpellAction.tscn")
var isGuarding = false

func _ready():
	stats.reset()
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)
	init_spells(spells.get_children())
	
	if Game:
		Console = Game.get_node_or_null("Console")
	defeated.connect(Callable(Console,'on_battler_defeated'))
	damaged.connect(Callable(Console,'on_battler_damaged'))

func init_spells(spells: Array) -> void:
	for spell in spells:
		var new_spell = spell_action_scene.instantiate()
		new_spell.spell = spell.spell
		actions.get_node("Spell").add_child(new_spell)

func _process(delta):
	Status_Label.text = "HP: " + str(stats.health) + "\nMP: " + str(stats.mana)

func damage(source,amount):
	if isGuarding:
		amount = amount / 2
	stats.health-=amount
	damaged.emit(source,self,damage)
	if stats.health<=stats.max_health:
		alive = false
		defeated.emit(self)
		#battle_log_text.emit(str(name) + " is defeated!")

func get_actions():
	return actions.get_children()
