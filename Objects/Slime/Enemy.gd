extends CharacterBody2D

@export var speed : float
var direction : Vector2

@export var damage : int
@export var hit_force := 500.0

func _process(delta: float) -> void:
	direction = global_position.direction_to(Player.I.global_position)

func _physics_process(delta: float) -> void:
	velocity = speed * direction
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hit(damage, direction, hit_force)
