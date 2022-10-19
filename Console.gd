extends Control

class_name Console

@onready var output = $Output

func _ready():
	output.text = "Console"

func _on_battle_log_text(text):
	output.text = str(output.text, "\n", text)
