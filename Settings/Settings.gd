extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	# Play settings music
	MusicController.play_settings_music()


func _on_main_menu_button_down():
	get_tree().change_scene_to_file("res://MainMenu/main.tscn")
