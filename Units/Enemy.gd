extends "res://Units/Unit.gd"

var target

var health = 1000

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_to_group("enemy")
	pass
	
func _process(delta):
	pass
		
func _physics_process(delta):
	# input
	
	target = null
	var players = get_tree().get_nodes_in_group("player")
	for p in players:
		target = p
		break
	if target:
		var v = target.translation
		v.y = self.translation.y
		look_at(v, Vector3(0,1,0))
	pass


func get_movement_data():
	# Call function in base class 
	var dict = .get_movement_data()
	var dir = null
	if target:
		dir = target.translation - self.translation
		dir.y = 0
		dict.dir = dir.normalized()
		dict.speed = 20
	return dict

func turn_process(delta,facing_pos,turn_speed):
	var cur_fac = self.get_global_transform().basis.x.normalized()
	var tar_fac = (facing_pos-self.translation).normalized()
	var angle = cur_fac.dot(tar_fac)
	if angle > turn_speed:
		angle = turn_speed
	elif angle < -turn_speed:
		angle = -turn_speed
	self.rotate(Vector3(0,1,0),angle)
	pass

	
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

func hit(dict):
	if not $Particles.emitting:
		$Particles.restart()
	var damage = dict.damage
	health -= damage
	print("Damage: ", damage)
	print("Health: ", health)
	if health < 0:
		queue_free()
	pass