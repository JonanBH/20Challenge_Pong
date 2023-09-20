extends RigidBody2D
class_name Ball

const MAX_SPEED : float = 150.0
const RADIUS : float = 32

@export var speed : float = 30.0
@export var speed_increment : float = 0.5


func _physics_process(delta):
	angular_velocity = 0
	rotation = 0


func set_direction(direction : Vector2):
	linear_velocity = direction * speed


func _on_body_entered(body):
	speed = min(speed + speed_increment, MAX_SPEED)
	linear_velocity = linear_velocity.normalized() * speed
