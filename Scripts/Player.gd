extends KinematicBody2D

const GRAVITY = 10
const JUMP_SPEED = -400
var velocity = Vector2.ZERO


func _process(_delta):
	velocity.y += GRAVITY
	check_if_key_pressed()
	move_and_slide(velocity)


func check_if_key_pressed():
	print ()
	if Input.is_action_just_pressed("ui_up"):
		jump()


func jump():
	velocity.y = JUMP_SPEED
