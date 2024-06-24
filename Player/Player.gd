extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
const speed_bonus = 50.0
const climb_speed = 50
var canClimb = false
var isClimbing = false
var timer := Timer.new()
var isPlayerDamaged = false
var isTimerRunning = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimationPlayer")
@onready var pause_menu = $Camera2D/PauseMenu
var paused = false

#func _ready():
	#HealthBar.init_health(Game.playerHP)
	
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
	
func _physics_process(delta):
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == -1:
		get_node("AnimatedSprite2D").flip_h = true
	elif direction == 1:
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
		queue_free()
		get_tree().change_scene_to_file("res://main.tscn")

func _player_hurt():
	if isPlayerDamaged == true:
		isTimerRunning = false
		isPlayerDamaged = false # If player damaged again, it will trigger else
		await get_tree().create_timer(30).timeout
		if isTimerRunning == false:
			_player_gains_health()
	else:
		isPlayerDamaged = true
		isTimerRunning = true
		await get_tree().create_timer(30).timeout
		if isTimerRunning == true:
			_player_gains_health()
	
func _player_gains_health():
	while Game.playerHP < 90:
		await get_tree().create_timer(.5).timeout
		Game.playerHP += 1
	isPlayerDamaged = false

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
	if jump_boost == 0:
		$Sounds/Jump.play()
		velocity.y = JUMP_VELOCITY
	else:
		$Sounds/JumpPad.play()
		velocity.y = JUMP_VELOCITY + jump_boost
		
	anim.play("Jump")

#func _set_health(value):
	#super._set_health(value)
	#HealthBar.health = health
