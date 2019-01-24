extends KinematicBody


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass
	
func _process(delta):
	pass
	
func _physics_process(delta):	
	movement_process(delta)
	pass

func get_movement_data():
	var dict = {}
	dict.dir = Vector3(0,0,0)
	dict.speed = 0
	return dict

var g = -9.8
var vel = Vector3()
func movement_process(delta):
	var md = get_movement_data()
	var move_dir = md.dir
	var move_speed = md.speed
	# Gravity & Movement
	var target = move_dir.normalized() * move_speed
		
	vel.y += delta*g

	var hvel = vel
	hvel.y = 0
		
	var accel
	if (move_dir.dot(hvel) > 0):
		accel = 2 #ACCEL
	else:
		accel = 4 #DEACCEL

	hvel = hvel.linear_interpolate(target, accel*delta)

	vel.x = hvel.x
	vel.z = hvel.z
	
	vel = move_and_slide(vel,Vector3(0,1,0))
	
	pass

func hit(dict):
	var damage = dict.damage
	print("Hit damage: ", damage)
	pass