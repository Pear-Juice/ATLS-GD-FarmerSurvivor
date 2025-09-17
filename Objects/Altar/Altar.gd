extends Node

@export var level := 0

var gem_upgrade_count := 3
var gem_count := 0:
	set(value):
		$GemCount.text = str(value)
		gem_count = value

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		gem_count += body.gem_count
		body.gem_count = 0
		
		if gem_count >= gem_upgrade_count:
			body.upgrade_gun()
			gem_count = 0
		
		
