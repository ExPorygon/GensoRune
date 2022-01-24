extends CombatAction

var action_name = "Guard"

func execute(target: Battler):
	actor.isGuarding = true
	emit_signal("battle_log_text",actor.name + " guards!")
