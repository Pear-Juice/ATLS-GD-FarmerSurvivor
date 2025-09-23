extends Area2D

var captured_enemies : Array[CharacterBody2D]
@export var fill_max := 5

var open := true
var capture_time : int

var time_limit_tween : Tween

@export var gem_tscn : PackedScene

func _ready():
	$CaptureIndicator.max_value = fill_max
	$AnimatedSprite2D.play("Open")

func _on_body_entered(body: Node2D) -> void:
	if open && body.is_in_group("Enemy"):
		Spawner.I.slime_killed()
		body.capture()
		captured_enemies.append(body)
		
		$CaptureIndicator.value = captured_enemies.size()
		
		$TimeLimitIndicator.value = 1
		if time_limit_tween:
			time_limit_tween.kill()
		
		time_limit_tween = create_tween()
		time_limit_tween.tween_property($TimeLimitIndicator, "value", 0, 10)
		time_limit_tween.finished.connect(eject)
		
		if captured_enemies.size() == 1:
			capture_time = Time.get_ticks_msec()
			
		if captured_enemies.size() >= fill_max:
			trap_full()
			
func trap_full():
	open = false
	time_limit_tween.kill()
	spawn_gem()
	$AnimatedSprite2D.play("Close")
	$TimeLimitIndicator.value = 0
	var tween = get_tree().create_tween().tween_property($CaptureIndicator, "value", 0, 5)
	clear()
	await tween.finished
	$AnimatedSprite2D.play("Open")
	open = true

func spawn_gem():
	var gem = gem_tscn.instantiate()
	gem.global_position = $GemSpawn.global_position
	get_tree().root.call_deferred("add_child", gem)

func eject():
	open = false
	for enemy in captured_enemies:
		enemy.respawn()
		$CaptureIndicator.value -= 1
		await get_tree().create_timer(0.3).timeout
		
	open = true

func clear():
	for enemy in captured_enemies:
		enemy.kill()
	captured_enemies.clear()
