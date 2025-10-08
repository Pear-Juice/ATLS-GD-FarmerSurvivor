extends Control

func _on_quit_button_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Menus/Main Menu/Main Menu.tscn")

func _on_replay_button_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
