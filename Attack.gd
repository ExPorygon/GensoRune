extends CombatAction

var action_name = "Attack"

func execute(target):
	var damage: int
	damage = actor.stats.attack - target.stats.defense
	if target.isGuarding:
		damage = damage / 2
	target.stats.health -= damage
	emit_signal("battle_log_text",actor.name + " attacks! " + target.name + " takes " + str(damage) + " damage!")
