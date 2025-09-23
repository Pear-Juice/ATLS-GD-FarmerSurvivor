extends CharacterBody2D

@export var speed : float
var direction : Vector2

@export var damage : int
@export var hit_force := 500.0

@export var stun_length := 0.5

var can_hit := true

@export var size := 1
@export var nav_agent : NavigationAgent2D

var next_player_path_pos : Vector2

func hit(force : Vector2):
	if can_hit:
		can_hit = false
		velocity = force
		push(force, [], true)
		$SlimeBody/FarmerSprites.play("Angry")
		
		await get_tree().create_timer(stun_length).timeout
		can_hit = true
		$SlimeBody/FarmerSprites.play("Walk")

func push(force : Vector2, prev : Array[Node2D], initial := false):
	if self in prev:
		return
	
	if !initial:
		print("+")
		velocity += force
		can_hit = false
		await get_tree().create_timer(stun_length).timeout
		can_hit = true
		
	else:
		print("----")
		
	prev.append(self)
	var str = "Push: "
	for i in prev:
		str += ", " + i.name
	print(str)
	
	move_and_slide()
	for body_index in get_slide_collision_count():
		#print("PUSH", body_index)
		var collider = get_slide_collision(body_index).get_collider()
		if collider.is_in_group("Enemy"):
			prints("Collided with: ", collider.name, prev)
			collider.push(force, prev)

func capture():
	$SlimeBody/FarmerSprites.play("Angry")
	can_hit = false
	$Area2D/AreaCollisionShape.set_deferred("disabled", true)
	var tween = get_tree().create_tween().tween_property(self, "scale", Vector2(0,0), 0.3)
	await tween.finished

func kill():
	queue_free()
	
func respawn():
	can_hit = true
	$SlimeBody/FarmerSprites.play("Walk")
	$Area2D/AreaCollisionShape.set_deferred("disabled", false)
	var tween = get_tree().create_tween().tween_property(self, "scale", Vector2(1,1), 0.3)
	

func _process(delta: float) -> void:
	direction = global_position.direction_to(next_player_path_pos)

func _physics_process(delta: float) -> void:
	nav_agent.target_position = Player.I.global_position
	next_player_path_pos = nav_agent.get_next_path_position()
	if can_hit:
		velocity = speed * direction
		$SlimeBody/AttackSprites.flip_h = direction.x > 0
			
	else:
		velocity *= 0.9
		var last_collision = get_last_slide_collision()
		
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		body.hit(damage, direction, hit_force)
		$SlimeBody/AttackSprites.play()
	elif body.is_in_group("Bullet"):
		hit(body.velocity.normalized() * body.knockback)
		body.hit()
