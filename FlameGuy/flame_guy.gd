extends CharacterBody2D
var can_interact = false
var interacting = false
var index = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# If the player can interact with the npc
	if can_interact == true:
		if Input.is_action_just_pressed("interact"):
			$Dialogue2.play(12)
			$Dialogue.start()
			interacting = true
			
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		can_interact = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		can_interact = false

func _on_dialogue_dialogue_finished():
	interacting = false
