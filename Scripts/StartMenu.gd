extends Node

const CLOUDS = preload("res://Scenes/Clouds.tscn")
const EXIT_MENU = preload("res://Scenes/ExitMenu.tscn")
var last_spawned_cloud = null

func _ready():
	spawn_initial_clouds()

func _process(_delta):
	check_spawn_clouds()
	check_start()
	check_exit_button()
	
func check_spawn_clouds():
	if (last_spawned_cloud.position.x < -2792):
		spawn_clouds()

func check_start():
	if Input.is_action_just_pressed("ui_start_game"):
		Global.go_to_scene("res://Scenes/ChoosePlayerMenu.tscn")
		
func check_exit_button():
	if Input.is_action_just_pressed("ui_end"):
		var exit_menu_instance = EXIT_MENU.instance()
		add_child(exit_menu_instance)

func spawn_initial_clouds():
	var clouds_instance = CLOUDS.instance()
	clouds_instance.position.x = -431
	$CloudsContainer.add_child(clouds_instance)
	last_spawned_cloud = clouds_instance

func spawn_clouds():
	var clouds_instance = CLOUDS.instance()
	$CloudsContainer.add_child(clouds_instance)
	last_spawned_cloud = clouds_instance
