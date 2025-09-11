extends Control

func _ready():
	$VBoxContainer/startBt.grab_focus()

func _on_startbt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_charselectbt_pressed() -> void:
	pass


func _on_quitbt_pressed() -> void:
	get_tree().quit()
