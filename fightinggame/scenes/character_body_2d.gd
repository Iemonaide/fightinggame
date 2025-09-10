extends CharacterBody2D

@export var speed = 650
@export var jump_velocity = -420
@export var gravity = 980 # Adjust based on your game's scale
@export var max_hp: int = 100
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
		velocity.y = 500


	#motion inputs gun head help me help me help me
	if is_on_floor() and Input.is_action_pressed("up") and Input.is_action_just_pressed("lightattack"):
		velocity.y = jump_velocity


	# Move and slide
	move_and_slide()

var current_hp: int
signal hp_changed(new_hp: int)
signal died

func _ready() -> void:
	current_hp = max_hp

func take_damage(amount: int) -> void:
	current_hp -= amount
	current_hp = clamp(current_hp, 0, max_hp)

	emit_signal("hp_changed", current_hp)

	if current_hp <= 0:
		die()

func die() -> void:
	emit_signal("died")
	queue_free()	# Replace with respawn logic if needed

func apply_hit(damage: int, knockback: Vector2) -> void:
	take_damage(damage)

	# Knockback scales slightly as HP drops
	var hp_ratio = float(max_hp - current_hp) / max_hp
	velocity = knockback.normalized() * (damage * 5 + hp_ratio * 50)
