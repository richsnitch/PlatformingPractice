extends CharacterBody2D
var can_interact = false
var interacting = false
var index = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if can_interact == true:
		if Input.is_action_just_pressed("interact"):
			$"FlameGuy Messages".show()
			index += 1
			if Input.is_action_just_pressed("interact"):
				$"FlameGuy Messages".show()
				index += 1
			
func _on_player_detection_body_entered(body):
	if body.name == "Player":
		can_interact = true

func _on_player_detection_body_exited(body):
	if body.name == "Player":
		can_interact = false
