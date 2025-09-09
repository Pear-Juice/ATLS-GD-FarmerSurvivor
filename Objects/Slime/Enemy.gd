extends CharacterBody2D

@export var speed : float
var direction : Vector2

@export var damage : int
@export var hit_force := 500.0

@export var stun_length := 0.5

var can_hit := true

func hit(force : Vector2):
	if can_hit:
		can_hit = false
		velocity = force
		set_hurt_sprites(true)
		
		await get_tree().create_timer(stun_length).timeout
		can_hit = true
		set_hurt_sprites(false)

func set_hurt_sprites(on : bool):
	if on:
		$SlimeBody.visible = false
		$SlimeBodyHurt.visible = true
	else:
		$SlimeBody.visible = true
		$SlimeBodyHurt.visible = false

func kill():
	set_hurt_sprites(true)
	can_hit = false
	$Area2D/AreaCollisionShape.set_deferred("disabled", true)
	var tween = get_tree().create_tween().tween_property(self, "scale", Vector2(0,0), 0.3)
	await tween.finished
	queue_free()

func _process(delta: float) -> void:
	direction = global_position.direction_to(Player.I.global_position)

func _physics_process(delta: float) -> void:
	if can_hit:
		velocity = speed * direction
	else:
		velocity *= 0.9
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hit(damage, direction, hit_force)
	elif body.is_in_group("Bullet"):
		hit(body.velocity.normalized() * body.knockback)
		body.hit()
