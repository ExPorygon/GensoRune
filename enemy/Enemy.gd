extends Entity

class_name Enemy

signal damaged_player

func play_turn():
	print(name)
	yield(get_tree(), "idle_frame")
	damage_player()
	
func damage_player():
	emit_signal("damaged_player",attack)

func on_damaged_enemy(damage):
	life-=(damage-defense)

func _process(delta):
	$Label.text = str(life)
