extends Node2D

var cherry = preload("res://Collectables/cherry.tscn")



func _on_timer_timeout():
	var cherryTemp = cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randi_range(10,400)
	cherryTemp.position = Vector2(ranint,0)
	add_child(cherryTemp)
