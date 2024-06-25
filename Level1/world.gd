extends Node2D

@onready var player = $Player/Player


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level_music()

	
func _process(delta):
	# If the player is currently climbing
	if player.isClimbing == true:
		# If the player is climbing, set their x_position equal to the middle of the ladder
		player.position.x = player.ladder_x_position

func _on_mc_golden_1_body_entered(body):
	if body.name == "Player":
		$Collect.play()
		$Mcgoldcan/McGolden1/Timer.start()
		body.SPEED += 200
		$Mcgoldcan.queue_free()
		$Mcgoldcan/McGolden1.queue_free()
		
func _on_timer_timeout():
	player.SPEED -= 200
	
