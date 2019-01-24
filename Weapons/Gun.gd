extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

export var bullet_type = preload("res://Weapons/Bullet.tscn")
export var fire_rate = 10
var fire_cooldown = 0

export var aiming_movement_speed = 20
export var firing_movement_speed = 10
export var aiming_turn_speed = 0.2
export var firing_turn_speed = 0.05

var pressed = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _physics_process(delta):
	fire_cooldown -= delta
	if pressed and fire_cooldown <= 0 :
		fire()
		fire_cooldown = 1.0 / fire_rate 
#		print(fire_cooldown)
	pass

func trigger_press():
	pressed = true
	pass
	
func trigger_release():
	pressed = false
	pass
	
	
func fire():
	var bullet = bullet_type.instance()
	bullet.set_transform($BulletPosition3D.get_global_transform().orthonormalized())
	get_tree().get_root().get_node("Main").add_child(bullet)
	pass