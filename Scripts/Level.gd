extends Node

const OBSTACLE = preload("res://Scenes/Obstacle.tscn")

func _on_Timer_timeout():
	var obstacle_instance = OBSTACLE.instance()
	add_child(obstacle_instance)
	

