extends VideoPlayer

func _on_VideoPlayer_finished():
	Global.go_to_scene("res://Scenes/StartMenu.tscn")
