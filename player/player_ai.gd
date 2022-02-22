extends BattlerAI

const BattleMenu = preload("res://BattleMenu.tscn")
const SelectArrow = preload("res://SelectArrow.tscn")

func choose_action(actor : Battler):
	var action: CombatAction
	var menu =  BattleMenu.instance()
	actor.add_child(menu)
	menu.init(actor)
	action = yield(menu,"action_selected")
	return action

func choose_target(actor : Battler, action: CombatAction, battlers : Array = []):
	var arrow = SelectArrow.instance()
	actor.add_child(arrow)
	var target
	target = arrow.select_target(battlers)
	return target
