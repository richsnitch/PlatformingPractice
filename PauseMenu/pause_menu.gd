extends Control

# PauseMenu node is two directories below the player
@onready var main = $"../"

func _on_resume_pressed():
	main.pauseMenu()

func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://MainMenu/main.tscn")

func _on_quit_pressed():
	get_tree().quit()


func _on_settings_pressed():
	$SettingsMarginContainer.show()
	$MarginContainer.hide()

func _on_back_pressed():
	$SettingsMarginContainer.hide()
	$MarginContainer.show()
