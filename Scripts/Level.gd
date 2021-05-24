extends Node

const OBSTACLE = preload("res://Scenes/Obstacle.tscn")
const LOST_MENU = preload("res://Scenes/LostMenu.tscn")
const EXIT_MENU = preload("res://Scenes/ExitMenu.tscn")
const CLOUDS = preload("res://Scenes/Clouds.tscn")

func _ready():
	Global.has_lost = false
	Global.game_paused = false
	spawn_initial_clouds()
	
func _process(_delta):
	update_score()
	check_exit_button()
	
func _on_ObstacleSpawnTimer_timeout():
	if Global.has_lost == false and Global.game_paused == false:
		spawn_obstacle()
	
func lost():
	Global.has_lost = true
	$ScoreTimer.stop()
	get_tree().call_group("Obstacles", "make_obstacles_stop")
	get_tree().call_group("Clouds", "make_clouds_stop")
	var lost_menu_instance = LOST_MENU.instance()
	add_child(lost_menu_instance)

func pause():
	Global.game_paused = true
	$ScoreTimer.paused = true
	get_tree().call_group("Obstacles", "make_obstacles_stop")
	get_tree().call_group("Clouds", "make_clouds_stop")

func end_pause():
	if Global.has_lost == false:
		Global.game_paused = false
		$ScoreTimer.paused = false
		get_tree().call_group("Obstacles", "make_obstacles_start_again")
		get_tree().call_group("Clouds", "make_clouds_start_again")
		
func spawn_obstacle():
	var obstacle_instance = OBSTACLE.instance()
	add_child(obstacle_instance)


func _on_ScoreTimer_timeout():
	Global.current_score += 1
	
func update_score():
	$ScoreText.text = "SCORE: " + str(Global.current_score)

func check_exit_button():
	if Input.is_action_just_pressed("ui_end") and Global.game_paused == false:
		var exit_menu_instance = EXIT_MENU.instance()
		add_child(exit_menu_instance)
		pause()


func _on_CloudsTimer_timeout():
	if Global.has_lost == false and Global.game_paused == false:
		spawn_clouds()

func spawn_clouds():
	print("hi")
	var clouds_instance = CLOUDS.instance()
	add_child(clouds_instance)
	
func spawn_initial_clouds():
	var clouds_instance = CLOUDS.instance()
	clouds_instance.position.x = -431
	add_child(clouds_instance)
