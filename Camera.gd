extends Camera

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var target
var zoom = 35

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	target = get_tree().get_root().get_node("Main/Player")
	
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	self.translation.x = 0 + target.translation.x
	self.translation.y = zoom + target.translation.y
	self.translation.z = 10 + target.translation.z
	look_at(target.translation,Vector3(0,1,0))
	
	
func zoom_out():
	zoom += 1
func zoom_in():
	zoom -=1
	