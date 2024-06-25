extends Node2D

@onready var pause_menu = $Player/Player/CanvasLayer/PauseMenu
var paused = false


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_level_music()
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused

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


func _on_mc_golden_1_body_entered(body):
	if body.name == "Player":
		$Collect.play()
		$Mcgoldcan/McGolden1/Timer.start()
		body.SPEED += 200
		$Mcgoldcan.queue_free()
		$Mcgoldcan/McGolden1.queue_free()
		

func _on_timer_timeout():
	$Player/Player.SPEED -= 200
	
	
