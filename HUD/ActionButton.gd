extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var action

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func _gui_input(event):
	print("_gui_input Button")

func _on_ActionButton_pressed():
	print("_on_ActionButton_pressed")
	pass # replace with function body
