extends Node2D


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://level_2.tscn")

# Go back to main menu
func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_texture_button_1_pressed():
	get_tree().change_scene_to_file("res://world.tscn")

func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://level_3.tscn")
