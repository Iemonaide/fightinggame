extends CharacterBody2D

@export var speed = 650
@export var jump_velocity = -420
@export var gravity = 980 
@export var can_doublejump = true
@onready var sprite = $tempguy

@export var player_id := 1:
	set(id):
		player_id = id

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta
	#check if moving left
	if velocity.x < 0:
		sprite.flip_h = true
	#check if moving right
	elif velocity.x > 0:
		sprite.flip_h = false
	
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
		velocity.y = 500

	# Move and slide
	move_and_slide()
