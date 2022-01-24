extends Node2D

class_name TurnQueue

var active_char: Battler

func _ready():
	randomize()
	init()
	play_turn()

func init():
	active_char = get_child(0)

func play_turn():
	var target: Battler
	var action: CombatAction
	active_char.isGuarding = false
	
	var opponents: Array
	if active_char.is_in_group("enemies"):
		opponents = get_party()
	else:
		opponents = get_enemies()
	
	action = yield(active_char.ai.choose_action(active_char), "completed")
	target = yield(active_char.ai.choose_target(active_char,action,opponents), "completed")
	
	action.execute(target)
	
	var new_index : int = (active_char.get_index()+1) % get_child_count()
	active_char = get_child(new_index)
	play_turn()

func get_enemies():
	return get_tree().get_nodes_in_group("enemies")

func get_party():
	return get_tree().get_nodes_in_group("party")
