class_name Controls

extends Control

static var previous_scene : String

func _on_back_button_pressed() -> void:
	if previous_scene != "Game":
		get_tree().change_scene_to_file(previous_scene)
	else:
		visible = false
