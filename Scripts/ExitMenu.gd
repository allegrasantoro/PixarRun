extends Control

func _process(delta):
	yes_button_pressed_handler()
	no_button_pressed_handler()

func yes_button_pressed_handler():
	if $MenuBackground/YesButton.pressed == true:
		print("hello")
		get_tree().quit()

func no_button_pressed_handler():
	if $MenuBackground/NoButton.pressed == true:
		print("ghhggh")
		queue_free() 
		get_tree().call_group("Levels", "end_pause")
