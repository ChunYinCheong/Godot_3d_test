extends RigidBody

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 500
var damage = 100

var particles_type = preload("res://Weapons/BulletParticles.tscn")

const unit_class = preload("res://Units/Unit.gd")

func _ready():	
	var dir = (-self.get_transform().basis.z).normalized()
	#var o = get_global_transform().origin
	#translate(Vector3(0,0,-1))
	#o = get_global_transform().origin
	#apply_impulse(o, dir * 1000)
	set_linear_velocity(dir*25)
	pass


func _on_Timer_timeout():
	queue_free()
	pass # replace with function body
	

func _on_Bullet_body_entered(body):
	queue_free()
	pass # replace with function body
