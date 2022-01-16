extends Control

class_name Console

onready var output = $Output

func _ready():
	output.text = "Console"

func _on_output_text(text):
	print("Signal received!")
	output.text = str(output.text, "\n", text)
