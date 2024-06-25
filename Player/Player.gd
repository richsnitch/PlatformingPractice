extends CharacterBody2D

var SPEED = 150.0
const JUMP_VELOCITY = -400.0
const speed_bonus = 50.0
const climb_speed = 50
var canClimb = false
var isClimbing = false
var inArea
var used_jumppad = false
var ladder_x_position = 0.0

@onready var pause_menu = $Camera2D/PauseMenu
var paused = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")

	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()


func pauseMenu():
	if paused:
		# Hide the pause menu
		pause_menu.hide()
		# Resets the in game clock back to normal speed
		Engine.time_scale = 1
	else:
		# Show the pause menu
		pause_menu.show()
		# Set the in game clock to freeze (when the pause menu is up everything in the background stops running)
		Engine.time_scale = 0
	
	paused = !paused
	
func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		# Player is moving left
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
		# Player is moving right
		get_node("AnimatedSprite2D").flip_h = false
	if canClimb == false:
		if not is_on_floor():
			velocity.y += gravity * delta
		if direction:
			velocity.x = direction * SPEED
			# If shift is being held down and the player is facing right
			#if Input.is_action_just_pressed("sprint"):
				# $Sounds/Accelerate.play()
			if Input.is_action_pressed("sprint") and direction == 1:
				velocity.x += speed_bonus
			# If shift is being held down and the player is facing left
			if Input.is_action_pressed("sprint") and direction == -1:
				velocity.x += (speed_bonus * -1)
			# if shift has been released
			if Input.is_action_just_released("sprint"):
				velocity.x = direction * SPEED
			if velocity.y == 0:
				anim.play("Run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			if canClimb == false:
				anim.play("Idle")
				
	elif canClimb == true:
		# If the player can climb, call this function
		_player_can_climb(direction)
			
	if velocity.y > 0 and canClimb == false:
		anim.play("Fall")
	elif velocity.y < 0 and canClimb == false:
		anim.play("Jump")

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		_player_jump(0)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	move_and_slide()
	
	if Game.playerHP <= 0:
		# If the player runs out of hp, delete the player node and send them back to the main menu
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")


func _player_can_climb(direction):
	# Prevents user from continuing to climb if they release the key
	velocity.y = 0
	if Input.is_action_pressed("ui_up"):
		velocity.y = -climb_speed
		anim.play("Climb")
		isClimbing = true
		
	elif Input.is_action_pressed("ui_down"):
		velocity.y = climb_speed
		anim.play("Climb")
		isClimbing = true
	# If the player has reached the floor, allow them to walk/sprint again
	elif is_on_floor():
		anim.play("Idle")
		direction = Input.get_axis("ui_left", "ui_right")
		velocity.x = direction * SPEED
		isClimbing = false 
		
func _player_jump(jump_boost):
	# If there is no jump boost, the player is just pressing 'space'
	if jump_boost == 0:
		$Sounds/Jump.play()
		velocity.y = JUMP_VELOCITY
		
	# If the user hits a jump pad
	else:
		$Sounds/JumpPad.play()
		velocity.y = JUMP_VELOCITY + jump_boost
		
	anim.play("Jump")
