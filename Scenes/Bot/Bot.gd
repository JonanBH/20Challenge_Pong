extends Node2D

@export var correct_input_change : float = 0.4

var target_ball : Ball

@onready var paddle : Paddle = $Paddle

func _process(delta):
	var need_to_go = 0
	if target_ball != null:
		if target_ball.position.y < position.y:
			need_to_go = -1
		elif target_ball.position.y > position.y:
			need_to_go = 1
	
	if randf() <= correct_input_change:
		_move_order(need_to_go, delta)
	else:
		var actual_order = randi_range(-1, 1)
		while actual_order == need_to_go:
			actual_order = randi_range(-1, 1)
		
		_move_order(actual_order, delta)


func _move_order(direction, delta):
	if direction < 0:
		paddle.move_up(delta)
	elif direction > 0:
		paddle.move_down(delta)


func set_is_facing_left(is_facing_left):
	paddle.set_facing_left(is_facing_left)
