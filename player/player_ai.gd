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
#	yield(get_tree(), "idle_frame") #this wait is necessary to avoid an error with some regard to the function completed signal, will have to investigate later
#	return get_parent().get_parent().get_node("Enemy1")
	var arrow = SelectArrow.instance()
	actor.add_child(arrow)
	var target
	target = arrow.select_target(battlers)
	return target
