extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var speed = 500
var damage = 100

var particles_type = preload("res://Weapons/BulletParticles.tscn")

const unit_class = preload("res://Units/Unit.gd")
func _physics_process(delta):
	var space_state = get_world().direct_space_state
	# use global coordinates, not local to node
	var from = get_global_transform().origin
	translate(Vector3(0,0,-delta * speed))
	var to = get_global_transform().origin
	var result = space_state.intersect_ray(from, to)	
	if result:
		print("Hit: ", result)		
		var collider = result.collider
		var particles = particles_type.instance()
		get_tree().get_root().add_child(particles)	
		particles.global_translate(result.position)		
		#if collider.has_method('hit'):
			#collider.hit()
		if collider is unit_class:
			var tf = (to - from).normalized()
			var normal = result.normal	
			var dotProduct = abs(normal.dot(tf))
			result.damage = damage * dotProduct
			result.direction = tf
			collider.hit(result)
			#explode_actor()
		#else:
			#explode_wall()
		queue_free()
	pass
	


func _on_Timer_timeout():
	queue_free()
	pass # replace with function body
	