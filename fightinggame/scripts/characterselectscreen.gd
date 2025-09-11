extends Control

func _on_backtostartbt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/startmenu.tscn")
