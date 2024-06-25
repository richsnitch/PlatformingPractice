extends Node2D

func _ready():
	MusicController.music = MusicController.menu_music

func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://Level1/world.tscn")
	
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://Level2/level_2.tscn")

# Go back to main menu
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main.tscn")

func _on_texture_button_1_pressed():
	get_tree().change_scene_to_file("res://Level1/world.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://Level3/level_3.tscn")
