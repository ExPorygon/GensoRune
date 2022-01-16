extends BattlerAI

func choose_action(actor : Battler):
	var label = Label.new()
	var action: CombatAction
	add_child(label)
	label.text = "Press Enter or Z to attack Enemy! \nPress X to Guard!"
	while true:
		yield(get_tree(), "idle_frame")
		if Input.is_action_just_pressed("ui_accept"):
			action = actor.actions.get_node("Attack")
			break
		elif Input.is_action_just_pressed("ui_cancel"):
			action = actor.actions.get_node("Guard")
			break
	label.queue_free()
	return action

func choose_target(actor : Battler, action: CombatAction, battlers : Array = []):
	yield(get_tree(), "idle_frame") #this wait is necessary to avoid an error with some regard to the function completed signal, will have to investigate later
	return get_parent().get_parent().get_node("Enemy1")
