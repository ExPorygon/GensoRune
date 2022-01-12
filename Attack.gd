extends CombatAction

func execute(target):
	var damage: int
	damage = actor.stats.attack - target.stats.defense
	if target.isGuarding:
		damage = damage / 2
	target.health -= damage
