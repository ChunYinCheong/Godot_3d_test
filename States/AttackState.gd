extends "res://States/State.gd"

var dur

func _init():
	state_name = "Attack State"
	jump_speed = 0
	move_speed = 30
	turn_speed = 360
	
func enter_state():
	dur = 0.0
	pass
	
func process_state(delta):
	var aim_dir = character.get_aim_position()
	move_dir = character.get_move_dir()
	character.turn_process(delta,aim_dir,turn_speed)
	character.movement_process(delta,move_dir,move_speed,jump_speed)
	dur += delta
	if dur <= 0.3:
		# Attacking
		# Do damage
		pass
	else:
		# Attack animation end
		
		return true
	pass
	
func exit_state():
	pass
	
func can_switch_to(s):
	return true
		