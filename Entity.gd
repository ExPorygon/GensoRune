class_name Entity

extends Node2D

onready var _value = {}


export var life = 50
export var attack = 5
export var defense = 2


func set_value(key,value):
	_value[key] = value
	
func get_value(key):
	return _value.get(key)
	
func get_value_default(key,default):
	return _value.get(key,default)

func is_value_existing(key):
	return _value.has(key)
	
func delete_value(key):
	return _value.erase(key)
