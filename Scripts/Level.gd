extends Node

const OBSTACLE = preload("res://Scenes/Obstacle.tscn")
const LOST_MENU = preload("res://Scenes/LostMenu.tscn")
var has_lost = false

func _process(delta):
	update_score()
	
func _on_ObstacleSpawnTimer_timeout():
	if has_lost == false:
		spawn_obstacle()
	
func lost():
	has_lost = true
	$ScoreTimer.stop()
	get_tree().call_group("Obstacles", "make_obstacles_stop")
	var lost_menu_instance = LOST_MENU.instance()
	add_child(lost_menu_instance)

func spawn_obstacle():
	var obstacle_instance = OBSTACLE.instance()
	add_child(obstacle_instance)


func _on_ScoreTimer_timeout():
	Global.current_score += 1
	
func update_score():
	$ScoreText.text = "SCORE: " + str(Global.current_score)
