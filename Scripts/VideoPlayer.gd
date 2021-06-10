extends VideoPlayer

func _process(delta):
	check_skip()

func check_skip():
	if Input.is_action_just_pressed("ui_skip"):
		Global.go_to_scene("res://Scenes/StartMenu.tscn")
	
func _on_VideoPlayer_finished():
	Global.go_to_scene("res://Scenes/StartMenu.tscn")
