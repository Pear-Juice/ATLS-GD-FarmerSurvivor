extends Control

func pause():
	visible = true
	get_tree().paused = true

func resume():
	visible = false
	get_tree().paused = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		if !get_tree().paused:
			pause()
		elif get_tree().paused && !%Controls.visible:
			resume()
		elif %Controls.visible:
			%Controls.visible = false
	
func _on_resume_button_pressed() -> void:
	resume()


func _on_controls_button_pressed() -> void:
	Controls.previous_scene = "Game"
	%Controls.visible = true

func _on_quit_button_pressed() -> void:
	await get_tree().process_frame
	get_tree().paused = false
	#get_tree().unload_current_scene()
	get_tree().change_scene_to_file("res://Menus/Main Menu/Main Menu.tscn")
