extends Control

func _ready():
	$Background/HighestScoreText.text = "HIGHEST SCORE: " + str(Global.highest_score)
	$Background/YourScoreText.text = "YOUR SCORE: " + str(Global.current_score)

func _process(delta):
	if $Background/TryAgainButton.pressed:
		Global.current_score = 0
		get_tree().change_scene("res://Scenes/Level.tscn")
