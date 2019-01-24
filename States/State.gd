extends Node


var state_name = "State"
var character #= preload("res://Characters/Character.tscn").instance()

var jump_speed = 0
var move_speed = 0	
var move_dir = Vector3(0,0,0)
var turn_speed = 0


func init(c):
	character = c
	return self
	
func enter_state():
	pass
	
func process_state(delta):	
	pass
	
	
func exit_state():
	pass
	
func handle_input():
	pass