extends Control

class_name BattleMenu

signal action_selected()

@onready var MainMenu = $MainMenu
@onready var SpellMenu = $SpellMenu
var Actor: Battler

func _ready():
	MainMenu.get_child(0).grab_focus()
	
func init(actor: Battler):
	Actor = actor
	init_main()
	init_spells()
	
func init_spells():
	var spells = Actor.active_spells.get_children()
	for spell in spells:
		var new_button = create_button(spell)
		

func init_main():
	var buttons = MainMenu.get_children()
	var actions = Actor.get_actions()
	var action_names: Array
	for action in actions:
		action_names.append(action.name)
	
	for button in buttons:
		button.pressed.connect(Callable(self,"_on_Button_pressed").bind(button.name,button.get_parent()))
		if action_names.find(button.name) == -1:
			button.disabled = true
			button.focus_mode = FOCUS_NONE

func create_button(spell):
	var button = Button.new()
	button.name = spell.name
	button.text = spell.name
	#button.minimum_size = Vector2(0,27)
	button.size_flags_vertical = 0
	SpellMenu.add_child(button)
	SpellMenu.move_child(button, 0)
	button.pressed.connect(Callable(self,"_on_Button_pressed").bind(button.name,button.get_parent()))
	button.focus_neighbor_left = button.get_path()
	return button

func _on_Button_pressed(name,parent):
	if name == "Spell":
		SpellMenu.visible = true
		SpellMenu.get_child(0).grab_focus()
		MainMenu.focus_mode = FOCUS_NONE
		return
	
	
	var action: CombatAction
	if parent.name == "MainMenu":
		action = Actor.get_node("Actions/"+str(name))
	if parent.name == "SpellMenu":
		action = Actor.get_node("Actions/Spell/"+str(name))
		
	action_selected.emit(action)
	queue_free()

func _on_Back_pressed():
	SpellMenu.visible = false
	MainMenu.focus_mode = FOCUS_ALL
	MainMenu.get_child(0).grab_focus()
