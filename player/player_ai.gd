extends BattlerAI

const BattleMenu = preload("res://BattleMenu.tscn")
const SelectArrow = preload("res://SelectArrow.tscn")

func choose_action(actor : Battler):
	var action: CombatAction
	var menu =  BattleMenu.instantiate()
	actor.add_child(menu)
	menu.init(actor)
	action = await menu.action_selected
	return action

func choose_spell(actor : Battler):
	var spell: SpellAction
	var menu = BattleMenu.instantiate()

func choose_target(actor : Battler, action: CombatAction, battlers : Array = []):
	var arrow = SelectArrow.instantiate()
	actor.add_child(arrow)
	var target
	target = await arrow.select_target(battlers)
	return target
