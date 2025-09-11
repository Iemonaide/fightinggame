extends CharacterBody2D

@export var speed = 650
@export var jump_velocity = -420
@export var gravity = 980 # Adjust based on your game's scale
@export var can_doublejump = true

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
		velocity.y = 500


	#motion inputs gun head help me help me help me
	#I am not doing this shit now

	# Move and slide
	move_and_slide()

# Signals are crucial for decoupling and communication
@export var max_health: int = 1000
var current_health: int
signal health_changed(new_health)
signal depleted()

func _ready():
	current_health = max_health
	
func take_damage(amount: int):
	# This prevents the health from dropping below zero
	current_health = max(0, current_health - amount)
	emit_signal("health_changed", current_health)
	if current_health <= 0:
		emit_signal("depleted")

func heal(amount: int):
	# This prevents health from exceeding the maximum
	current_health = min(max_health, current_health + amount)
	emit_signal("health_changed", current_health)

func set_max_health(new_max: int):
	if new_max > 0:
		max_health = new_max
		# Adjust current health if the new max is lower
	current_health = min(current_health, max_health)
	emit_signal("health_changed", current_health)
