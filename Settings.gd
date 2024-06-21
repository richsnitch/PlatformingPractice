extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Play settings music
	MusicController.play_settings_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_main_menu_pressed():
	# Go back to main menu
	get_tree().change_scene_to_file("res://main.tscn")
