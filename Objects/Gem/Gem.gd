extends Node



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		body.gem_count += 1
		queue_free()
