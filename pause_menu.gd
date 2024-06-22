extends Control

# PauseMenu node is two directories below the player
@onready var main = $"../../"

func _on_resume_pressed():
	main.pauseMenu()

func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_quit_pressed():
	get_tree().quit()
