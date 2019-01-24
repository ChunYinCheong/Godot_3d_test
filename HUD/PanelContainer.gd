extends PanelContainer

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var buttons = []
var character

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	character = get_tree().get_root().get_node("Main/Player")
	buttons.resize(12)

	buttons[0] = $GridContainer/ActionButton
	buttons[1] = $GridContainer/ActionButton2
	buttons[2] = $GridContainer/ActionButton3
	buttons[3] = $GridContainer/ActionButton4
	buttons[4] = $GridContainer/ActionButton5
	buttons[5] = $GridContainer/ActionButton6
	buttons[6] = $GridContainer/ActionButton7
	buttons[7] = $GridContainer/ActionButton8
	buttons[8] = $GridContainer/ActionButton9
	buttons[9] = $GridContainer/ActionButton10
	buttons[10] = $GridContainer/ActionButton11
	buttons[11] = $GridContainer/ActionButton12
	
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _gui_input(event):
	print("_gui_input PanelContainer")
	