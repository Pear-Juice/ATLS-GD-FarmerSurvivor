extends CharacterBody2D

@export var speed : float
var direction : Vector2

func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down")).normalized()
	
func _physics_process(delta: float) -> void:
	velocity = speed * direction
	move_and_slide()
