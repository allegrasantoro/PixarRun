extends Node

const OBSTACLE = preload("res://Scenes/Obstacle.tscn")
const LOST_MENU = preload("res://Scenes/LostMenu.tscn")
const EXIT_MENU = preload("res://Scenes/ExitMenu.tscn")
var has_lost = false
var paused = false

func _process(delta):
	update_score()
	check_exit_button()
	
func _on_ObstacleSpawnTimer_timeout():
	if has_lost == false and paused == false:
		spawn_obstacle()
	
func lost():
	has_lost = true
	$ScoreTimer.stop()
	get_tree().call_group("Obstacles", "make_obstacles_stop")
	var lost_menu_instance = LOST_MENU.instance()
	add_child(lost_menu_instance)

func pause():
	paused = true
	$ScoreTimer.paused = true
	get_tree().call_group("Obstacles", "make_obstacles_stop")

func end_pause():
	if has_lost == false:
		paused = false
		$ScoreTimer.paused = false
		get_tree().call_group("Obstacles", "make_obstacles_start_again")
		
func spawn_obstacle():
	var obstacle_instance = OBSTACLE.instance()
	add_child(obstacle_instance)


func _on_ScoreTimer_timeout():
	Global.current_score += 1
	
func update_score():
	$ScoreText.text = "SCORE: " + str(Global.current_score)

func check_exit_button():
	if Input.is_action_just_pressed("ui_end") and paused == false:
		var exit_menu_instance = EXIT_MENU.instance()
		add_child(exit_menu_instance)
		pause()
