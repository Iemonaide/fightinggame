extends Control

func _ready():
	$VBoxContainer/startbutton.grab_focus()

func _on_startbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_charselectbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/charselectmenu.tscn")


func _on_quitbutton_pressed() -> void:
	get_tree().quit()


func _on_settingsbutton_pressed() -> void:
	pass # Replace with function body.
