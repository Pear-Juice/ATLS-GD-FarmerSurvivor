extends CharacterBody2D

@export var speed : float
var direction : Vector2

func _process(delta: float) -> void:
	direction = global_position.direction_to(Player.I.global_position)
	
func _physics_process(delta: float) -> void:
	velocity = speed * direction
	move_and_slide()
