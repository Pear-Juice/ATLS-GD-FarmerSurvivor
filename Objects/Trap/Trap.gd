extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		body.kill()
	elif body is Player:
		body.kill()
