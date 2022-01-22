extends CombatAction

func execute(target: Battler):
	actor.isGuarding = true
	emit_signal("battle_log_text",actor.name + " guards!")
