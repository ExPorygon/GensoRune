extends BattlerAI

func choose_action(actor : Battler):
	var label = Label.new()
	add_child(label)
	
	var result = rand_int(2)
	var action: CombatAction
	if result == 0:
		label.text = "Enemy attacks!"
		action = actor.actions.get_node("Attack")
	else:
		label.text = "Enemy guards!"
		action = actor.actions.get_node("Guard")
		
	for i in 60:
		yield(get_tree(), "idle_frame")
	label.queue_free()
	return action

func choose_target(actor : Battler, action: CombatAction, battlers : Array = []):
	var result = rand_int(2)
	var target: Battler
	if result == 0:
		target = get_parent().get_parent().get_node("Player1")
	else:
		target = get_parent().get_parent().get_node("Player2")
	
	for i in 10: #this wait is necessary to avoid an error with some regard to the function completed signal, will have to investigate later
		yield(get_tree(), "idle_frame")
	return target

func rand_int(r):
	return randi() % r
