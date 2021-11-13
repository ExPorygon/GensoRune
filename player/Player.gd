extends Entity

class_name Player

signal damaged_enemy

func play_turn():
	print(name)
	while true:
		yield(get_tree(), "idle_frame")
		if Input.is_action_just_pressed("ui_accept"):
			break
	damage_enemy()

func damage_enemy():
	emit_signal("damaged_enemy",attack)

func on_damaged_player(damage):
	life-=(damage-defense)
