extends Node

@export var focus_shift := 1.0
@export var focus_shift_duration := .1

@export var select_shift := 100
@export var select_shift_duration := 1

@export var game_scene : PackedScene

func focus_button(button : Button):
	print("Focus ", button.name)
	create_tween().tween_method(func(pos): button.set_position(button.position + pos), Vector2.ZERO, Vector2(focus_shift,0), focus_shift_duration)
	
func unfocus_button(button : Button):
	print("Unfocus ", button.name)
	create_tween().tween_method(func(pos): button.set_position(button.position + pos), Vector2.ZERO, Vector2(-focus_shift,0), focus_shift_duration)

func _on_start_game_pressed() -> void:
	create_tween().tween_method(func(pos): %StartGameButton.set_position(%StartGameButton.position + pos), Vector2.ZERO, Vector2(select_shift,0), select_shift_duration)
	create_tween().tween_property(%StartGameButton, "self_modulate", Color(0,0,0,0), select_shift_duration / 3.0)
	await get_tree().create_timer(0.3).timeout
	get_tree().change_scene_to_packed(game_scene)

func _on_controls_pressed() -> void:
	create_tween().tween_method(func(pos): %ControlsButton.set_position(%ControlsButton.position + pos), Vector2.ZERO, Vector2(select_shift,0), select_shift_duration)
	create_tween().tween_property(%ControlsButton, "self_modulate", Color(0,0,0,0), select_shift_duration / 3.0)
	
	Controls.previous_scene = "res://Menus/Main Menu/Main Menu.tscn"
	get_tree().change_scene_to_file("res://Menus/Controls/Controls.tscn")

func _on_quit_pressed() -> void:
	create_tween().tween_method(func(pos): %QuitButton.set_position(%QuitButton.position + pos), Vector2.ZERO, Vector2(select_shift,0), select_shift_duration)
	create_tween().tween_property(%QuitButton, "self_modulate", Color(0,0,0,0), select_shift_duration / 3.0)
	get_tree().quit()

#Signals --------------------------


func _on_start_game_button_mouse_entered() -> void:
	focus_button(%StartGameButton)

func _on_controls_button_mouse_entered() -> void:
	focus_button(%ControlsButton)

func _on_quit_button_mouse_entered() -> void:
	focus_button(%QuitButton)

func _on_start_game_button_mouse_exited() -> void:
	unfocus_button(%StartGameButton)

func _on_controls_button_mouse_exited() -> void:
	unfocus_button(%ControlsButton)

func _on_quit_button_mouse_exited() -> void:
	unfocus_button(%QuitButton)
