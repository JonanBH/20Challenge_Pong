extends Node2D
class_name Level

@export_category("references")
@export var ball_scene : PackedScene
@export var player_paddle_scene : PackedScene
@export var bot_paddle : PackedScene

@export_category("P1 Inputs")
@export var p1_up_input = "up"
@export var p1_down_input = "down"

@export_category("P2 Inputs")
@export var p2_up_input = "up"
@export var p2_down_input = "down"

var last_spawned_ball : Ball

@onready var balls_parent = $Balls
@onready var paddles_parent = $Paddles
@onready var hud := $HUD

var left_score : int = 0
var right_score : int = 0

func _unhandled_input(event):
	if event is InputEventKey:
		event = event as InputEventKey
		if event.is_action_pressed("open_menu"):
			hud.open_pause_menu()


func _ready():
	_spawn_paddles(false, false)
	call_deferred("_spawn_ball")


func _spawn_ball():
	last_spawned_ball = ball_scene.instantiate()
	balls_parent.add_child(last_spawned_ball)
	last_spawned_ball.position = $BallSpawn.position
	
	$LaunchBallTimer.start()


func _on_launch_ball_timer_timeout():
	var horizontal = [-1,1].pick_random()
	var vertical = randf_range(0.2, 0.8)
	
	var velocity = Vector2(horizontal, vertical).normalized()
	last_spawned_ball.set_direction(velocity)


func _spawn_paddles(is_left_bot : bool = false, is_right_bot : bool = false):
	if is_left_bot :
		pass
	else:
		_spawn_player_paddle($LeftSpawn.position, p1_up_input, p1_down_input, false)
	
	if is_right_bot :
		pass
	else:
		_spawn_player_paddle($RightSpawn.position, p2_up_input, p2_down_input, true)


func _spawn_player_paddle(position, up_input, down_input, is_facing_left : bool):
	var player = player_paddle_scene.instantiate() as Player
	player.up_input = up_input
	player.down_input = down_input
	player.call_deferred("set_is_facing_left",is_facing_left)
	
	paddles_parent.add_child(player)
	player.position = position


func _check_end_game():
	hud.update_scores(left_score, right_score)
	
	if left_score == 10:
		pass
	elif right_score == 10:
		pass
	else:
		call_deferred("_spawn_ball")


func _on_left_score_detector_scored():
	right_score += 1
	_check_end_game()


func _on_right_score_detector_scored():
	left_score += 1
	_check_end_game()
