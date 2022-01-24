extends Control

class_name BattleMenu

signal action_selected()

onready var MainMenu = $MainMenu
var Actor: Battler

func _ready():
	MainMenu.get_child(0).grab_focus()
	
func init(actor: Battler):
	Actor = actor
	var buttons = MainMenu.get_children()
	var actions = Actor.get_actions()
	var action_names: Array
	
	for action in actions:
		action_names.append(action.name)
	
	for button in buttons:
		button.connect("pressed", self, "_on_Button_pressed",[button.name])
		if action_names.find(button.name) == -1:
			button.disabled = true
			button.focus_mode = FOCUS_NONE

func _on_Button_pressed(name):
	var action = Actor.get_node("Actions/"+name)
	emit_signal("action_selected", action)
	queue_free()
