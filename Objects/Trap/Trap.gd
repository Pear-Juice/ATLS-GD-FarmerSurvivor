extends Area2D

var captured_enemies : Array[CharacterBody2D]
@export var fill_max := 5

var open := true
var capture_time : int


func _on_body_entered(body: Node2D) -> void:
	if open && body.is_in_group("Enemy"):
		body.capture()
		captured_enemies.append(body)
		
		if captured_enemies.size() == 1:
			capture_time = Time.get_ticks_msec()
		
		if captured_enemies.size() >= fill_max:
			open = false
