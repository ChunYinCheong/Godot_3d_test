extends "res://States/State.gd"

func _init():
	state_name = "Firing State"
	jump_speed = 0
	move_speed = 0
	
func enter_state():
	move_speed = character.weapon.firing_movement_speed
	turn_speed = character.weapon.firing_turn_speed
	character.weapon.trigger_press()
	pass
	
func process_state(delta):		
	var aim_dir = character.get_aim_position()
	character.turn_process(delta,aim_dir,turn_speed)
	var move_dir = character.get_move_dir()
	character.movement_process(delta,move_dir,move_speed,jump_speed)
	#character.weapon.trigger_is_pressed()
	pass
	
func exit_state():
	character.weapon.trigger_release()
	pass
	
func can_switch_to(s):
	return true		
		
func handle_input():
	if not Input.is_action_pressed("trigger"):
		character.stop_action()	
		if Input.is_action_pressed("aiming"):
			character.do_action(character.state_aiming)
	pass	