extends KinematicBody2D

var stop_moving = false

func _process(delta):
	if stop_moving == false :
		move(delta)
	
func move(delta):
	position.x += Global.speed * delta

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func make_clouds_stop():
	stop_moving = true

func make_clouds_start_again():
	stop_moving = false

