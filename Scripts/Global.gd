extends Node

var current_score = 0
var highest_score = 0
var speed = -900
var game_paused = false
var has_lost = false
var followingScene = "" 
var currentPlayer = "i"
const EXIT_MENU = preload("res://Scenes/ExitMenu.tscn")

func _ready():
	$FadingAnimation.play("fadeToBlack")
	print(get_tree().get_current_scene().get_name())
func _process(delta):
	check_exit_button()
	
func check_exit_button():
	if Input.is_action_just_pressed("ui_end") and Global.game_paused == false:
		var exit_menu_instance = EXIT_MENU.instance()
		get_tree().get_root().get_node(".").add_child(exit_menu_instance)
		if get_tree().get_current_scene().get_name() == "Level":
			get_tree().call_group("Levels", "pause")
			
func go_to_scene(path):
	followingScene = path
	$FadingAnimation.play_backwards("fadeToBlack")

func deferred_go_to_scene(path):
	get_tree().change_scene(path)
	$FadingAnimation.play("fadeToBlack")
	
	
func _on_FadingAnimation_animation_finished(anim_name):
	if followingScene != "":
		call_deferred("deferred_go_to_scene", followingScene)
	followingScene = ""
