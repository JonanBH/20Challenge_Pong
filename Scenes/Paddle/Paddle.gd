extends CharacterBody2D
class_name Paddle

@export var base_speed : float = 20

var x_position : float = 0

func _ready():
	x_position = position.x

func _physics_process(delta):
	position.x = x_position

func move_up(delta):
	velocity = Vector2.UP * base_speed * delta
	move_and_collide(velocity)


func move_down(delta):
	velocity = Vector2.DOWN * base_speed * delta
	move_and_collide(velocity)


func set_facing_left(is_facing_left):
	$Sprite2D.flip_h = is_facing_left
