extends Node2D

func _ready():
	Utils.saveGame()
	MusicController.play_music()
	Utils.loadGame()

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://level_select.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings.tscn")


