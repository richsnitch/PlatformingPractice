extends Node2D
var inArea = false

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level3_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If the player is in the area2D of the warp
	if inArea == true:
		# Show the label for the warp
		$Warp.show()
		# If the user presses 't', warp them to level 1
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Level1/world.tscn")
	else:
		# Hide the warp if not in the area
		$Warp.hide()

func _on_house_door_body_entered(body):
	if body.name == "Player":
		if inArea == false:
			inArea = true
	
func _on_house_door_body_exited(body):
	if body.name == "Player":
		if inArea == true:
			inArea = false
