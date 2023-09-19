extends RigidBody2D
class_name Ball


@export var speed : float = 30.0
@export var speed_increment : float = 0.5

func set_direction(direction : Vector2):
	linear_velocity = direction * speed


func _on_body_entered(body):
	speed += speed_increment
