extends BattlerAI

func choose_action(actor : Battler, battlers : Array = []):
	var label = Label.new()
	add_child(label)
	label.text = "Enemy attacks!"
	for i in 60:
		yield(get_tree(), "idle_frame")
	label.queue_free()
	return get_parent().get_parent().get_node("Player2")
