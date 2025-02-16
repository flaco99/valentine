extends CharacterBody3D

@export var player: CharacterBody3D  # Drag the player into this in Inspector
@export var flowers_mesh: MeshInstance3D  # Drag the "flowers" mesh in the Inspector
@export var normal_mesh: MeshInstance3D  # Drag the normal dog mesh here
var is_found = false
var rotation_speed: float = 3.0

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Runs when the scene starts
func _ready():
	if normal_mesh:
		normal_mesh.visible = true
	if flowers_mesh:
		flowers_mesh.visible = false

func _physics_process(delta: float) -> void:

	# Get direction to player
	var direction = (player.global_transform.origin - global_transform.origin).normalized()
	
	# Check distance - stop moving if too close
	if ((global_transform.origin.distance_to(player.global_transform.origin) < 2) 
		and (is_found == false)):
		is_found = true;
		print("happy valentines")
		# Show flowers 
		if flowers_mesh and normal_mesh:
			normal_mesh.visible = true
			flowers_mesh.visible = true
	
	if (is_found):
		# Rotate to face the player
		var look_at_position = player.global_transform.origin
		look_at(Vector3(look_at_position.x, global_transform.origin.y, look_at_position.z), Vector3.UP)

	move_and_slide()
