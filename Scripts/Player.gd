extends KinematicBody2D

const GRAVITY = 40
var JUMP_SPEED = -1400
var velocity = Vector2.ZERO

func _ready():
	check_player_type()
	
func _process(_delta):
	check_if_key_pressed()
	velocity.y += GRAVITY
	check_is_on_floor()
	move_and_slide(velocity, Vector2.UP)	# The second parameter tells the game where up is

func check_player_type():
	if Global.currentPlayer == "i":
		JUMP_SPEED = -1250
		$playerSprite.animation = "i"
		$iCollisionBox.disabled = false
		$lampCollisionBox.disabled = true
		
	elif Global.currentPlayer == "lamp":
		JUMP_SPEED = -1400
		$playerSprite.animation = "lamp_running"
		$iCollisionBox.disabled = true
		$lampCollisionBox.disabled = false
		
func check_if_key_pressed():
	if Input.is_action_just_pressed("jump") and is_on_floor() and not Global.has_lost and not Global.game_paused:
		jump()


func jump():
	velocity.y = JUMP_SPEED
	Global.is_jumping = true

func check_lamp_jumping_up_or_falling():
		if velocity.y>0:
			$playerSprite.animation = "lamp_going_down"
		else:
			$playerSprite.animation = "lamp_going_up"

func check_is_on_floor():
	if Global.currentPlayer == "lamp":
		if is_on_floor():
			$playerSprite.animation = "lamp_running"
			Global.is_jumping = false
		else:
			Global.is_jumping = true
			check_lamp_jumping_up_or_falling()
		

	
