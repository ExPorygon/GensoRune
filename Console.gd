extends Control

class_name Console

@onready var output = $Output

func _ready():
	output.text = "Console"

func _on_battle_log_text(text):
	output.text = str(output.text, "\n", text)

func _on_battler_damage(attacker,target,damage):
	output.text = str(output.text, "\n", str(attacker.name) + " attacks! " + str(target.name) + " takes " + str(damage) + " damage!")

func _on_battler_defeated(battler):
	output.text = str(output.text, "\n", str(battler.name) + " is defeated!")
