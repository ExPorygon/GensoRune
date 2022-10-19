extends Resource

class_name SpellData

enum Target {
	ENEMY,
	SELF,
	PARTY,
}

enum Group {
	SINGLE,
	ALL,
	RANDOM,
}

@export var name: String = "Spell"

@export var base_damage: int
@export var mana_cost: int
@export var accuracy: float # (float, 0.0, 1.0)

@export var target_mode: Target
@export var group_mode: Group
