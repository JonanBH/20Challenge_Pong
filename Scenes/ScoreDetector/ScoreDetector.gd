extends Area2D

signal scored

func _on_body_entered(body):
	scored.emit()
	
	body.queue_free()
