extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level_music()
	

func _on_ladder_1_body_exited(body):
	if body.is_in_group("Climber"):
		if body.canClimb == true:
			body.canClimb = false
		if body.isClimbing == true:
			body.isClimbing = false


func _on_ladder_1_body_entered(body):
	if body.is_in_group("Climber"):
		if body.canClimb == false:
			body.canClimb = true


func _on_jumppad_1_body_entered(body):
	if body.name == "Player":
		body._player_jump(-200)
		body.used_jumppad = true

	
