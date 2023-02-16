extends CombatAction

var action_name = "Attack"
target_mode = 0

func execute(target):
	var damage: int
	damage = actor.stats.attack - target.stats.defense
	target.damage(actor,damage)
	#battle_log_text.emit(str(actor.name) + " attacks! " + str(target.name) + " takes " + str(damage) + " damage!")
