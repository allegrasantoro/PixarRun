extends Sprite


func _ready():
	check_player_type()

func check_player_type():
	if Global.currentPlayer == "i":
		set_texture(preload("res://Assets/i/shadow.png"))
	elif Global.currentPlayer == "lamp":
		set_texture(preload("res://Assets/Lamp/shadow32x32px.png"))
