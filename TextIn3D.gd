extends Spatial

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var text = ""
var ready = false
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	$MeshInstance/Viewport/Control/Label.text = text
	ready = true
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func set_text(t):
	text = str(t)
	if ready:
		$MeshInstance/Viewport/Control/Label.text = text