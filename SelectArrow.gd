extends Control

class_name SelectArrow

onready var tween = $Tween

signal target_selected(target)

var targets: Array
var active_target: Battler

func _ready():
	hide()

func select_target(battlers: Array):
	show()
	targets = battlers
	active_target = targets[0]
	set_global_position(active_target.global_position)
	grab_focus()
	var selected_target: Battler
	selected_target = yield(self,"target_selected")
	#hide()
	queue_free()
	return selected_target

func move_to(battler: Battler):
	tween.interpolate_property(
		self,
		'rect_global_position',
		rect_global_position,
		battler.global_position,
		0.1,
		Tween.TRANS_LINEAR,
		Tween.EASE_OUT
	)
	tween.start()

func _gui_input(event):
	if !visible:
		return
	
	if event.is_action_pressed("ui_accept"):
		emit_signal("target_selected",active_target)
		get_tree().set_input_as_handled()
#	elif event.is_action_pressed("ui_cancel"):
#		emit_signal("target_selected",null)
	
	var index = targets.find(active_target)
	if event.is_action_pressed("ui_right"):
		active_target = targets[(index+1) % targets.size()]
		move_to(active_target)
		get_tree().set_input_as_handled()
	if event.is_action_pressed("ui_left"):
		active_target = targets[(index-1) % targets.size()]
		move_to(active_target)
		get_tree().set_input_as_handled()
	
