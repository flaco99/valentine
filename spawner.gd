extends Node3D

@export var cat_scene: PackedScene  # Assign cat.tscn in Inspector
@export var dog_scene: PackedScene  # Assign dog.tscn in Inspector
@export var spawn_area: Vector3 = Vector3(10, 5, 10)  # X, Y, Z area size
@export var spawn_interval: float = 0.5  # How often new animals fall

var is_raining = false  # Controls when the rain starts

func start_rain():
	is_raining = true
	spawn_animals()  # Start the first spawn cycle

func spawn_animals():
	if not is_raining:
		return  # Stop if it's not time to rain

	var spawn_position = global_transform.origin + Vector3(
		randf_range(-spawn_area.x / 2, spawn_area.x / 2),
		spawn_area.y,  # Drop from sky height
		randf_range(-spawn_area.z / 2, spawn_area.z / 2)
	)

	var animal
	if randi() % 2 == 0:
		animal = cat_scene.instantiate()  # Spawn a cat
	else:
		animal = dog_scene.instantiate()  # Spawn a dog

	animal.global_transform.origin = spawn_position
	add_child(animal)

	# Keep spawning at intervals
	get_tree().create_timer(spawn_interval).timeout.connect(spawn_animals)
