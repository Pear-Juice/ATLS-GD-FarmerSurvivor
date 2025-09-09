extends Node2D

var mouse_pos : Vector2

func _process(delta: float) -> void:
	var dir = (mouse_pos - global_position).normalized()
	var angle = rad_to_deg(dir.angle()) + 90
	
	rotation_degrees = angle - get_parent().holder_angle

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_pos = event.global_position
