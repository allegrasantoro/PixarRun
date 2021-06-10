extends KinematicBody2D

const GRAVITY = 35
const JUMP_SPEED = -450
var velocity = Vector2.ZERO


func _process(_delta):
	check_if_key_pressed()
	velocity.y += GRAVITY
	move_and_slide(velocity, Vector2.UP)	# The second parameter tells the game where up is


func check_if_key_pressed():
	if Input.is_action_just_pressed("jump") and is_on_floor() and not Global.has_lost and not Global.game_paused:
		jump()


func jump():
	velocity.y = JUMP_SPEED
	velocity.y += JUMP_SPEED
