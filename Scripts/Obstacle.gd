extends Area2D

var speed = -500
var obstacle_list = ["luxo ball rolling", "wall-e walking"]
var stop_moving = false

func _ready():
	run_animated_sprite()
	
func _process(delta):
	if stop_moving == false : # Checks that the player hasn't died
		move(delta)
	

func _on_VisibilityNotifier2D_screen_exited(): # Makes obstacle disappear once it leaves the window
	queue_free()

func _on_Obstacle_body_entered(body): # Tells the level that the player has touched an obstacle
	get_tree().call_group("Levels", "lost")
	
func run_animated_sprite():
	var current_obstacle = get_randomised_obstacle()
	$AnimatedSprite.animation = current_obstacle
	change_obstacle_position(current_obstacle)
	turn_on_collision_shape(current_obstacle)
	$AnimatedSprite.playing = true

func move(delta):
	position.x += speed * delta

func get_randomised_obstacle():
	randomize()
	var current_obstacle = obstacle_list[randi() % obstacle_list.size()]
	return current_obstacle

func change_obstacle_position(obstacle): # The sprites are different sizes, therefore they have to be moved to match the floor height
	if obstacle == "luxo ball rolling":
		$AnimatedSprite.position.y = 16
	elif obstacle == "wall-e walking":
		$AnimatedSprite.position.y = 8
	else:
		print("invalid obstacle type in Obstacle script")
	
func turn_on_collision_shape(obstacle):
	if obstacle == "luxo ball rolling":
		$BallCollisionShape2D.disabled = false
	elif obstacle == "wall-e walking":
		$WallECollisionShape2D.disabled = false
	else:
		print("invalid obstacle type in Obstacle script")

func make_obstacles_stop():
	stop_moving = true
	$AnimatedSprite.playing = false

func make_obstacles_start_again():
	stop_moving = false
	$AnimatedSprite.playing = true
