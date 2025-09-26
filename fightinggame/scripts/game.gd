extends Node2D


func _on_returntomenu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/startmenu.tscn")


func become_host():
	print("Become host pressed")
	%MultiplayerHUD.hide()
	MultiplayerManager.become_host()

func join_as_player_2():
	print("Join as PLayer 2")
	%MultiplayerHUD.hide()
	MultiplayerManager.join_as_player_2()
