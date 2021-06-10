extends Control

func _ready():
	display_scores()

func _process(_delta):
	try_again_button_handler()
	check_selected_player_image()

func update_highest_score():
	if Global.current_score > Global.highest_score:
		Global.highest_score = Global.current_score
	
func display_scores():
	update_highest_score()
	$Background/HighestScoreText.text = "HIGHEST SCORE: " + str(Global.highest_score)
	$Background/YourScoreText.text = "YOUR SCORE: " + str(Global.current_score)

func try_again_button_handler():
	if $Background/TryAgainButton.pressed or Input.is_action_just_pressed("enter"):
		reset_level()

func check_selected_player_image():
	if Global.currentPlayer == "i":
		$Background/SelectedPlayerImage.set_texture(preload("res://Assets/i/i_default.png"))
	elif Global.currentPlayer == "lamp":
		$Background/SelectedPlayerImage.set_texture(preload("res://Assets/Lamp/lamp_walking_0.png"))
	
func _on_SwitchButton_pressed():
	if Global.currentPlayer == "i":
		Global.currentPlayer = "lamp"
	elif Global.currentPlayer == "lamp":
		Global.currentPlayer = "i"
	check_selected_player_image()
#

func reset_level():
	Global.current_score = 0
	Global.speed = -900
	get_tree().change_scene("res://Scenes/Level.tscn")


func _on_TextureButton_pressed():
	reset_level()
	Global.go_to_scene("res://Scenes/StartMenu.tscn")
