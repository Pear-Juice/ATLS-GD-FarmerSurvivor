extends Node2D

var mouse_pos : Vector2
var holder_angle : float

func _process(delta: float) -> void:
	var dir = (get_global_mouse_position() - global_position).normalized()
	holder_angle = rad_to_deg(dir.angle()) + 90
	
	rotation_degrees = holder_angle
