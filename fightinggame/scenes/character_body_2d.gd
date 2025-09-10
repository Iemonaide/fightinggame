extends CharacterBody2D

@export var speed = 550
@export var jump_velocity = -420
@export var gravity = 980 # Adjust based on your game's scale
var can_doublejump = true;

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# resets gravity when you touch floor
	if is_on_floor():
		gravity = 980

	# Handle horizontal movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity.x = input_direction.x * speed

	# Handle jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity
		can_doublejump = true
		# Double Jump
	if !is_on_floor() and can_doublejump and Input.is_action_just_pressed("jump"):
		velocity.y = jump_velocity
		can_doublejump = false

	# Fastfall func
	if !is_on_floor() and Input.is_action_just_pressed("down"):
		gravity = 3000
	
	#motion inputs gun head help me help me help me
	if is_on_floor() and Input.is_action_pressed("up") and Input.is_action_just_pressed("lightattack"):
		velocity.y = jump_velocity


	# Move and slide
	move_and_slide()
