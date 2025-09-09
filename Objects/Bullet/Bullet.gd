extends CharacterBody2D

@export var life_time : float

func _ready() -> void:
	await get_tree().create_timer(life_time).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	move_and_slide()
