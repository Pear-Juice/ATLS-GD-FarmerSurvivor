extends Node2D

var mouse_pos : Vector2
var holder_angle : float

func _process(delta: float) -> void:
	var dir = (mouse_pos - global_position).normalized()
	holder_angle = rad_to_deg(dir.angle()) + 90
	
	rotation_degrees = holder_angle
	
	#rotate_toward()

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse_pos = event.global_position
