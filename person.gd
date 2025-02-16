extends CharacterBody3D

@export var player: CharacterBody3D  # Drag the player into this in Inspector
var is_found = false
var rotation_speed: float = 3.0

const SPEED = 5.0
const JUMP_VELOCITY = 4.5

func _physics_process(delta: float) -> void:

	# Get direction to player
	var direction = (player.global_transform.origin - global_transform.origin).normalized()
	
	# Check distance - stop moving if too close
	if ((global_transform.origin.distance_to(player.global_transform.origin) < 2) 
		and (is_found == false)):
		is_found = true;
		# Show flowers (change mesh to obj holding flowers)
		print("happy valentines")
		
	if (is_found):
		# track direction and move to face her
		print("tracking")

	move_and_slide()
