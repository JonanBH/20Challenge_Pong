extends Node2D

class_name Player

@export var up_input : String = "up"
@export var down_input : String = "down"

@onready var paddle : Paddle = $Paddle

func _process(delta):
	var move = Input.get_axis(up_input, down_input)
	
	if move < 0:
		paddle.move_up(delta)
	elif move > 0:
		paddle.move_down(delta)


func set_is_facing_left(is_facing_left):
	paddle.set_facing_left(is_facing_left)
