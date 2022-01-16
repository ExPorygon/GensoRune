extends CombatAction

func execute(target: Battler):
	var damage: int
	damage = actor.stats.attack - target.stats.defense
	if target.isGuarding:
		damage = damage / 2
	target.stats.health -= damage
	emit_signal("output_text",actor.name + " does " + str(damage) + " damage to " + target.name)
