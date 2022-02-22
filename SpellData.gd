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

export var name: String

export var base_damage: int
export var mana_cost: int

export(Target) var target_mode
export(Group) var group_mode
