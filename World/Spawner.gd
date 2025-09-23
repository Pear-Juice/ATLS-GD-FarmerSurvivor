class_name Spawner

extends Node

static var I : Spawner

@export var slime_tscn : PackedScene
@export var slime_folder : Node

@export var rounds : Array[Round]
var round_index : int
var wave_index : int
var slimes_killed : int

var round_finished : bool

@export var min_spawn_distance := 500

func _init() -> void:
	I = self

func _ready() -> void:
	await get_tree().create_timer(1).timeout
	spawn_slimes(rounds[0].wave[0].z, rounds[0].wave[0].x)
	
func slime_killed():
	if round_index >= rounds.size():
		print("GAME OVER")
		return
	
	print("Wave ", wave_index, " out of ", rounds[round_index].wave.size())
	var last_wave : bool
	var next_spawn_count
	var next_distance
	
	if wave_index < rounds[round_index].wave.size()-1:
		var next_wave = rounds[round_index].wave[wave_index + 1]
		next_spawn_count = next_wave.x
		next_distance = next_wave.z
	else:
		last_wave = true
	
	var wave = rounds[round_index].wave[wave_index]
	
	var kill_req = wave.y
	
	slimes_killed += 1
	print(slimes_killed, " out of ", kill_req)
	if slimes_killed >= kill_req:
		print("Slime req met")
		slimes_killed = 0
		
		if !last_wave:
			wave_index += 1
			spawn_slimes(next_distance, next_spawn_count)
		else:
			print("Round Over")
			round_index += 1
			wave_index = 0
			
			if round_index >= rounds.size():
				print("GAME OVER")
				
			else:
				await get_tree().create_timer(5).timeout
				spawn_slimes(rounds[0].wave[0].z, rounds[0].wave[0].x)
	
func spawn_slimes(area : int, count : int):
	print("Spawn wave ", wave_index)
	for i in count:
		var slime = slime_tscn.instantiate()
		var np = [-1,1]
		np.shuffle()
		var rx = randi_range(min_spawn_distance, area) * np[0]
		np.shuffle()
		var ry = randi_range(min_spawn_distance, area) * np[0]
		slime.global_position = Player.I.global_position + Vector2(rx, ry)
		slime_folder.call_deferred("add_child", slime)
		await get_tree().create_timer(0.3).timeout
