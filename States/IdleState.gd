extends "res://States/State.gd"

func _init():
	state_name = "Idle State"
	jump_speed = 0
	move_speed = 30
	turn_speed = 360

func enter_state():
	pass
	
func process_state(delta):	
#	var aim_dir = character.get_aim_dir()
	move_dir = character.get_move_dir()
	character.turn_process(delta,move_dir+character.translation,turn_speed)
	character.movement_process(delta,move_dir,move_speed,jump_speed)
	pass
	
func exit_state():
	pass
	
func can_switch_to(s):
	return true
		
func handle_input():	
	if Input.is_action_pressed("trigger"):
		character.do_action(character.state_firing)
	elif Input.is_action_pressed("aiming"):
		character.do_action(character.state_aiming)
	elif Input.is_action_just_pressed("melee_attack"):
		character.do_action(character.state_attack)
	
	jump_speed = 5 if Input.is_action_pressed("jump") else 0
	pass