extends Node2D

class_name TurnQueue

var active_char

func _ready():
	init()
	play_turn()

func init():
	active_char = get_child(0)

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		play_turn()

func play_turn():
	print("Turn Start")
	yield(active_char.play_turn(), "completed")
	var new_index : int = (active_char.get_index()+1) % get_child_count()
	active_char = get_child(new_index)
	print("Turn End")
