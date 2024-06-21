extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level_music()


func _on_ladder_3_body_entered(body):
	if body.is_in_group("Climber"):
		if body.canClimb == false:
			body.canClimb = true


func _on_ladder_3_body_exited(body):
	if body.is_in_group("Climber"):
		if body.canClimb == true:
			body.canClimb = false
		if body.isClimbing == true:
			body.isClimbing = false
