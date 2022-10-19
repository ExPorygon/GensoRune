extends Resource

class_name CharacterStats

var health : int
var mana : int
@export var max_health : int
@export var max_mana : int
@export var attack : int
@export var defense : int
@export var speed : int

@export var level : int
@export var experience : int

func reset():
	health = max_health
	mana = max_mana

