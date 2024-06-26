extends Node2D

@onready var play_button = $Play as Button
@onready var quit_buttion = $Quit as Button
@onready var settings_button = $Settings as Button

func _ready():
	#Utils.saveGame()
	MusicController.play_menu_music()
	#Utils.loadGame()
	# Resets time scale (game's clock speed) to 1. Did this on ready because
	# to ensure the game was always running at the proper speed from the menu
	Engine.time_scale = 1

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	get_tree().change_scene_to_file("res://LevelSelect/level_select.tscn")

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://Settings/settings.tscn")

