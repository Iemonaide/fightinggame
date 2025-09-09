extends CharacterBody2D

@export var speed = 400
@export var jump_velocity = -400
@export var gravity = 980 # Adjust based on your game's scale

func _physics_process(delta):
	# Apply gravity
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle horizontal movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity.x = input_direction.x * speed

	# Handle jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Move and slide
	move_and_slide()
