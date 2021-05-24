extends Control

func _ready():
	display_scores()

func _process(_delta):
	try_again_button_pressed_handler()

func update_highest_score():
	if Global.current_score > Global.highest_score:
		Global.highest_score = Global.current_score
	
func display_scores():
	update_highest_score()
	$Background/HighestScoreText.text = "HIGHEST SCORE: " + str(Global.highest_score)
	$Background/YourScoreText.text = "YOUR SCORE: " + str(Global.current_score)

func try_again_button_pressed_handler():
	if $Background/TryAgainButton.pressed:
		Global.current_score = 0
		get_tree().change_scene("res://Scenes/Level.tscn")
