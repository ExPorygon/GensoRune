extends BattlerAI

func choose_action(actor : Battler, battlers : Array = []):
	var label = Label.new()
	add_child(label)
	label.text = "Press Enter or Z to attack Enemy!"
	while true:
		yield(get_tree(), "idle_frame")
		if Input.is_action_just_pressed("ui_accept"):
			break
	label.queue_free()
	return get_parent().get_parent().get_node("Enemy1")
