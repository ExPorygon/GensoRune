extends Node2D

class_name TurnQueue

var active_char: Battler

func _ready():
	init()
	play_turn()

func init():
	active_char = get_child(0)

func _process(delta):
	pass

func play_turn():
	var target: Battler
	print("Turn Start")
	target = yield(active_char.ai.choose_action(active_char), "completed")
	hit_target(active_char,target)
	
	var new_index : int = (active_char.get_index()+1) % get_child_count()
	active_char = get_child(new_index)
	print("Turn End")
	play_turn()

func hit_target(attacker,target):
	target.stats.health -= (attacker.stats.attack - target.stats.defense)
	print(target.stats.health)
