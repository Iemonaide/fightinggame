extends Node2D


func _on_returntomenu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/startmenu.tscn")
