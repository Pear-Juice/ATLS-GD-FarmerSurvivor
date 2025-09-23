extends Node2D

@export var bullets : Array[PackedScene]

var can_shoot := true

var angle : float

@export var gun_level := 0

func _process(delta: float) -> void:
	var dir = (get_global_mouse_position() - global_position).normalized()
	angle = rad_to_deg(dir.angle()) + 90
	
	rotation_degrees = angle - get_parent().holder_angle

	if Input.is_action_pressed("Shoot"):
		if can_shoot:
			can_shoot = false
			shoot()
			await get_tree().create_timer(0.5).timeout
			can_shoot = true
			
func shoot():
	var bullet = bullets[gun_level].instantiate() as CharacterBody2D
	bullet.global_position = $Barrel.global_position
	bullet.velocity = Vector2.UP.rotated(deg_to_rad(angle)) * bullet.speed
	bullet.rotation_degrees = angle
	get_tree().root.add_child(bullet)
	
	$CPUParticles2D.emitting = true
	await get_tree().create_timer(0.1).timeout
	
func upgrade_gun():
	gun_level += 1
	print("Upgrade!")
