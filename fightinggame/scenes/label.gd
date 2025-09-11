extends Label

@export var player_node: Node2D # Drag your player node here in the editor

var max_health = 1000 # Set your player's max health
var current_health = 1000 # Set the initial health

func _ready():
	# Connect a signal from the player to update health when it changes
	# This is a placeholder; you'll need to implement the signal in your player script
	# player_node.health_changed.connect(update_health_label)
	update_health_label()

func update_health_label():
	text = str(current_health) # Convert the health integer to a string

func take_damage(amount):
	current_health -= amount
	if current_health < 0:
		current_health = 0
	update_health_label()
