extends CombatAction

var action_name = "Attack"

func execute(target):
	var damage: int
	damage = actor.stats.attack - target.stats.defense
	target.damage(self,damage)
	#battle_log_text.emit(str(actor.name) + " attacks! " + str(target.name) + " takes " + str(damage) + " damage!")
