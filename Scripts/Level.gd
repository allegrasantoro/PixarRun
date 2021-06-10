extends Node

const OBSTACLE = preload("res://Scenes/Obstacle.tscn")
const LOST_MENU = preload("res://Scenes/LostMenu.tscn")
const CLOUDS = preload("res://Scenes/Clouds.tscn")
var last_spawned_cloud = null
var last_spawned_obstacle = null

func _ready():
	$Player.visible = true
	$iDeathVideo.visible = false
	Global.has_lost = false
	Global.game_paused = false
	spawn_initial_clouds()
	spawn_obstacle()
	print(get_tree().get_current_scene().get_name())
	$BackgroundMusic.play()
	
func _process(_delta):
	update_score()
	check_spawn_clouds()
	check_spawn_obstacles()
	
func lost():
	Global.has_lost = true
	$ScoreTimer.stop()
	get_tree().call_group("Obstacles", "make_obstacles_stop")
	get_tree().call_group("Clouds", "make_clouds_stop")
	$BackgroundMusic.stop()
	if Global.currentPlayer == "i":
		$iDeathVideo/TimeBeforeVideoStarts.start()
		
	else:
		spawn_lost_menu()

func _on_TimeBeforeVideoStarts_timeout():
	$Player.visible = false
	$iDeathVideo.visible = true
	$iDeathVideo.play()
	
func _on_iDeathVideo_finished():
	spawn_lost_menu()
	
func spawn_lost_menu():
	var lost_menu_instance = LOST_MENU.instance()
	add_child(lost_menu_instance)
	$SoundEffects.set_stream(load("res://Assets/Music/Lost.wav"))
	$SoundEffects.play()
	
func pause():
	Global.game_paused = true
	$ScoreTimer.paused = true
	get_tree().call_group("Obstacles", "make_obstacles_stop")
	get_tree().call_group("Clouds", "make_clouds_stop")
	$BackgroundMusic.stop()

func end_pause():
	if Global.has_lost == false:
		Global.game_paused = false
		$ScoreTimer.paused = false
		get_tree().call_group("Obstacles", "make_obstacles_start_again")
		get_tree().call_group("Clouds", "make_clouds_start_again")
		$BackgroundMusic.play()
		
func spawn_obstacle():
	var obstacle_instance = OBSTACLE.instance()
	add_child(obstacle_instance)
	last_spawned_obstacle = obstacle_instance

func _on_ScoreTimer_timeout():
	Global.current_score += 1
	
func update_score():
	$ScoreText.text = "SCORE: " + str(Global.current_score)

func spawn_clouds():
	var clouds_instance = CLOUDS.instance()
	$CloudsContainer.add_child(clouds_instance)
	last_spawned_cloud = clouds_instance
	
func spawn_initial_clouds():
	var clouds_instance = CLOUDS.instance()
	clouds_instance.position.x = -431
	$CloudsContainer.add_child(clouds_instance)
	last_spawned_cloud = clouds_instance

func check_spawn_clouds():
	if (last_spawned_cloud.position.x < -2792 and Global.has_lost == false and Global.game_paused == false):
		spawn_clouds()
		
func check_spawn_obstacles():
	if (last_spawned_obstacle.position.x < 1200 and Global.has_lost == false and Global.game_paused == false):
		print(str(Global.speed))
		spawn_obstacle()
	
func _on_SpeedTimer_timeout():
	if (Global.speed > -1200):
		Global.speed -= 200





