extends "res://States/State.gd"

func _init():
	state_name = "Aiming State"
	jump_speed = 0
	move_speed = 15
	
func enter_state():
	move_speed = character.weapon.aiming_movement_speed
	turn_speed = character.weapon.aiming_turn_speed
	pass
	
func process_state(delta):	
	var aim_dir = character.get_aim_position()
	character.turn_process(delta,aim_dir,turn_speed)
	move_dir = character.get_move_dir()
	character.movement_process(delta,move_dir,move_speed,jump_speed)
	pass
	
func exit_state():
	pass
	
func can_switch_to(s):
	return true
		
func handle_input():
	if Input.is_action_pressed("trigger"):
		character.do_action(character.state_firing)
	elif Input.is_action_just_pressed("melee_attack"):
		character.do_action(character.state_attack)
	elif not Input.is_action_pressed("aiming"):
		character.stop_action()
	pass