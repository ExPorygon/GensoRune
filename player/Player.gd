extends Entity

class_name Player

func play_turn():
	while true:
		if Input.is_action_pressed("ui_accept"):
			break
		yield(get_tree(), "idle_frame")
	damage_enemy()

func damage_enemy():
	pass
