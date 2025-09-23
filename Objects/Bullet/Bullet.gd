extends CharacterBody2D

@export var life_time : float
@export var knockback : float
@export var speed : float

@export var hit_particals : PackedScene

func hit():
	var particals = hit_particals.instantiate()
	particals.global_position = global_position
	get_tree().root.add_child(particals)
	queue_free()

func _ready() -> void:
	await get_tree().create_timer(life_time).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	move_and_slide()
