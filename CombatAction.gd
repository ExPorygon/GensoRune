extends Node

class_name CombatAction

signal battle_log_text

onready var Game = get_tree().get_root().get_node_or_null("Game")
onready var Console: Console
onready var actor = get_parent().get_parent()

func _ready():
	if Game:
		Console = Game.get_node_or_null("Console")
	if Console:
		print("Console exists")
		connect('battle_log_text', Console, '_on_battle_log_text')
	else:
		print("Console does not exist")

func execute(target: Battler):
	pass

