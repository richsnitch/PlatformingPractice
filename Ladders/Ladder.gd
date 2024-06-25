extends Area2D




func _on_body_entered(body):
	if body.is_in_group("Climber"):
		if body.canClimb == false:
			body.canClimb = true
			body.ladder_x_position = get_node(".").position.x + 39


func _on_body_exited(body):
	if body.is_in_group("Climber"):
		if body.canClimb == true:
			body.canClimb = false
		if body.isClimbing == true:
			body.isClimbing = false
	
