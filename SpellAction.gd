extends CombatAction

class_name SpellAction

var spell: SpellData = null

func _ready():
	name = spell.name
	actor = actor2
	#icon = spell.icon
	randomize()

func execute(target):
	actor.stats.mana -= spell.mana_cost
	
	var damage: int
	damage = actor.stats.attack+spell.base_damage - target.stats.defense
	
	if target.isGuarding:
		damage = damage / 2
	
	target.stats.health -= damage
	
	emit_signal("battle_log_text",str(actor.name) + " casts " + str(spell.name) + "! " + str(target.name) + " takes " + str(damage) + " damage!")
