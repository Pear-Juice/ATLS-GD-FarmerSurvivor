class_name Player

extends CharacterBody2D

static var I : Player

@export var speed : float
var direction : Vector2

@export var i_len := 0.2
@export var health : int
var can_hit := true
var hit_dir : Vector2
var hit_force : float

@export var hurt_color : Color

var gem_count : int:
	set(value):
		$CanvasLayer/GemCount.text = str(value)
		gem_count = value

func _init() -> void:
	I = self

func hit(damage : int, direction : Vector2, force : float):
	if can_hit:
		health -= damage
		velocity = direction * force
		hit_anim()
		
		can_hit = false
		if health <= 0:
			kill()
			return
		
		await get_tree().create_timer(i_len).timeout
		can_hit = true
		
func hit_anim():
	var sprites = $Sprites
	for sprite in sprites.get_children():
		sprite.self_modulate = hurt_color
		var tween = get_tree().create_tween().tween_property(sprite, "self_modulate", Color.WHITE, 0.4)

func kill():
	print("You died!")
	get_tree().call_deferred("reload_current_scene")

func upgrade_gun():
	$GunHolder/Gun.upgrade_gun()

func _process(delta: float) -> void:
	direction = Vector2(Input.get_axis("Left", "Right"), Input.get_axis("Up", "Down")).normalized()
	
func _physics_process(delta: float) -> void:
	if can_hit:
		velocity = speed * direction
	else:
		velocity *= 0.95

	move_and_slide()
