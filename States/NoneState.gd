extends "res://States/State.gd"
	
func process_state(delta):	
	character.movement_process(delta,move_dir,move_speed,jump_speed)
	return true
	pass