extends Control

func _on_startbt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game.tscn")


func _on_charselectbt_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/characterselectscreen.tscn")	


func _on_quitbt_pressed() -> void:
	get_tree().quit()

func become_host():
	print("Become host pressed")
	%MultiplayerHUD.hide()
	MultiplayerManager.become_host()

func join_as_player_2():
	print("Join as PLayer 2")
	%MultiplayerHUD.hide()
	MultiplayerManager.join_as_player_2()
