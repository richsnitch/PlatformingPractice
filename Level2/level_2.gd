extends Node2D

# Creating a variable for the player node
@onready var player = $Player
# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level_music()
	
func _process(delta):
	if player.isClimbing == true:
		# If the player is climbing, set their x_position equal to the middle of the ladder
		player.position.x = player.ladder_x_position

func _on_jumppad_1_body_entered(body):
	if body.name == "Player":
		# If the player hits a jumppad, give them a jump boost
		body._player_jump(-200)
		body.used_jumppad = true
