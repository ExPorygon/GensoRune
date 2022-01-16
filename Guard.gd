extends CombatAction

func execute(target: Battler):
	actor.isGuarding = true
	emit_signal("output_text",actor.name + " guards!")
