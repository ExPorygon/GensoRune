extends CombatAction

var action_name = "Guard"

func execute(target):
	actor.isGuarding = true
	battle_log_text.emit(str(actor.name) + " guards!")
