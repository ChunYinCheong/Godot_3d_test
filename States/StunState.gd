extends "res://States/State.gd"

func _init():
	state_name = "Stun State"

func enter_state():
	pass
	
func process_state(delta):	
	character.stun_duration -= delta	
	character.movement_process(delta,move_dir,move_speed,jump_speed)
	pass
	
func exit_state():
	pass
	
func can_switch_to(s):
	return true
		
		