extends Area2D

func _on_body_entered(body):
	if body.is_in_group("Climber"):
		if body.canClimb == false:
			body.canClimb = true
	

func _on_body_exited(body):
	if body.is_in_group("Climber"):
		if body.canClimb == true:
			body.canClimb = false
		if body.isClimbing == true:
			body.isClimbing = false
