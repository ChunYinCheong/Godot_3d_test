extends "res://Units/Unit.gd"

# Weapon
var weapon

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#set_process_input(true)	
	weapon = $Weapon
	add_to_group("player")
	pass
	
func _process(delta):	
	if(Input.is_key_pressed(KEY_ESCAPE)):
		get_tree().quit()
		
func _physics_process(delta):
	# input
	if Input.is_action_just_pressed("trigger"):
		weapon.trigger_press()
	elif Input.is_action_just_released("trigger"):
		weapon.trigger_release()
	
	if Input.is_action_pressed("trigger"):
		var s = 0.1
		var d = get_aim_position()
		turn_process(delta,d,s)
	elif Input.is_action_pressed("aiming"):
		var s = 1
		var d = get_aim_position()
		turn_process(delta,d,s)
		
	pass

func _input(event):
	if not event.is_echo():
		var camera = get_parent().get_node("Camera")
		if event.is_action("zoom_out"):
			camera.zoom_out()		
		elif event.is_action("zoom_in"):
			camera.zoom_in()		
	pass
		

func get_movement_data():
	# Call function in base class 
	var dict = .get_movement_data()
	dict.dir = get_move_dir()
	var speed = 30
	if Input.is_action_pressed("trigger"):
		speed = 10
	elif Input.is_action_pressed("aiming"):
		speed = 15
	dict.speed = speed
	return dict

func turn_process(delta,facing_pos,turn_speed):	
	# TODO
	var cur_fac = (-self.get_transform().basis.x).normalized() # This is "right"
	#print("cur:",cur_fac)
	var tar_fac = (facing_pos-self.translation).normalized()
	#print("tar:",tar_fac)
	var angle = cur_fac.dot(tar_fac) # This is not angle! It is -1 ~ 1!
	#print("a:",angle)
	if angle > turn_speed:
		angle = turn_speed
	elif angle < -turn_speed:
		angle = -turn_speed
	rotate(Vector3(0,1,0),angle)
	pass

func get_aim_position():
	if not Input.is_action_pressed("aiming") and not Input.is_action_pressed("trigger"):
		return self.translation
	var ray_length = 1000
	var camera = get_parent().get_node("Camera")
	var from = camera.project_ray_origin(get_viewport().get_mouse_position())
	var to = from + camera.project_ray_normal(get_viewport().get_mouse_position()) * ray_length
	var space_state = get_world().get_direct_space_state()
	var hit = space_state.intersect_ray(from, to)
	if hit.size() != 0:
		# collider will be the node you hit
#			print(hit.position)
		var p = hit.position
		p.y = self.translation.y
		var aiming_dir = hit.position - self.translation
		aiming_dir.y = self.translation.y
		return p
	else:
		return self.translation
	
func get_move_dir():
	var dir = Vector3(0,0,0) # Where does the player intend to walk to
	var cam_xform = get_parent().get_node("Camera").get_global_transform()
	
	if (Input.is_action_pressed("move_up")):
		dir += -cam_xform.basis[2]
	if (Input.is_action_pressed("move_down")):
		dir += cam_xform.basis[2]
	if (Input.is_action_pressed("move_left")):
		dir += -cam_xform.basis[0]
	if (Input.is_action_pressed("move_right")):
		dir += cam_xform.basis[0]
	dir.y = 0
	return dir
