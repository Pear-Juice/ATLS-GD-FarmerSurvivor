class_name Spawner

extends Node

@export var slime_tscn : PackedScene
@export var slime_folder : Node

func _ready() -> void:
	spawn_slimes(2000)
	
func spawn_slimes(area : int):
	while true:
		
		var slime = slime_tscn.instantiate()
		slime.global_position = Vector2(randi_range(-area,area), randi_range(-area,area))
		slime_folder.add_child(slime)
		await get_tree().create_timer(2).timeout
