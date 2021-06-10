extends Node

var currentPlayerSelection = "i"

func _ready():
	highlight_i()

func _process(delta):
	check_keyboard_inputs()
	
func check_keyboard_inputs():
	if Input.is_action_just_pressed("ui_switch_selection"):
		switch_selection()
	elif Input.is_action_just_pressed("enter"):
		start_game()
		
func highlight_i():
	currentPlayerSelection = "i"
	$Players/ArrowLamp.visible = false
	$Players/ArrowI.visible = true
	$Players/Lamp.animation = "lamp_default"
	$Players/Lamp.playing = false
	$Players/I.set_texture(preload("res://Assets/i/i white.png")) 

func highlight_lamp():
	currentPlayerSelection = "lamp"
	$Players/ArrowLamp.visible = true
	$Players/ArrowI.visible = false
	$Players/Lamp.animation = "lamp_walking_white"
	$Players/Lamp.playing = true
	$Players/I.set_texture(preload("res://Assets/i/i_default.png"))
	
func switch_selection():
	if currentPlayerSelection == "lamp":
		highlight_i()
	elif currentPlayerSelection == "i":
		highlight_lamp()
	else:
		print ("error in switch_selection() in ChoosePlayerMenu script")

func _on_ISelector_pressed():
	highlight_i()
	
func _on_LampSelctor_pressed():
	highlight_lamp()
	
func _on_StartButton_pressed():
	start_game()
	
func start_game():
	Global.currentPlayer = currentPlayerSelection
	Global.go_to_scene("res://Scenes/Level.tscn")


func _on_TextureButton_pressed():
	Global.go_to_scene("res://Scenes/StartMenu.tscn")
