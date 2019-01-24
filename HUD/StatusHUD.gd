extends Container

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var character_ref
var update = false

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_character(get_tree().get_root().get_node("Main").get_node("Player"))
	
	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	# print("test")
#	print(character)
	if update:
		if character_ref.get_ref() != null:
			var character = character_ref.get_ref()
			$ProgressBar.value = character.health
			$ProgressBar2.value = character.stamina
			$ProgressBar3.value = character.strength
			$ProgressBar4.value = character.sanity
		else:
			clear()
	pass

func set_character(c):
	if c != null:
		character_ref = weakref(c)
		$ProgressBar.max_value = c.max_health
		$ProgressBar2.max_value = c.max_stamina
		$ProgressBar3.max_value = c.max_strength
		$ProgressBar4.max_value = c.max_sanity
		update = true
		
func clear():
	update = false
	$ProgressBar.max_value = 1
	$ProgressBar2.max_value = 1
	$ProgressBar3.max_value = 1
	$ProgressBar4.max_value = 1
	$ProgressBar.value = 0
	$ProgressBar2.value = 0
	$ProgressBar3.value = 0
	$ProgressBar4.value = 0
	
	
	
	