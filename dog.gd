extends CharacterBody3D

@export var player: CharacterBody3D  # Drag the player into this in Inspector
@export var speed: float = 3.0  # Adjust speed
@export var follow_distance: float = 2.0  # Distance to stop following
var gravity: float = 9.8  # Gravity value


func _physics_process(delta):
	if not player:
		return  # Prevent errors if no player is assigned

	# Get direction to player
	var direction = (player.global_transform.origin - global_transform.origin).normalized()

	# Check distance - stop moving if too close
	if global_transform.origin.distance_to(player.global_transform.origin) > follow_distance:
		velocity = direction * speed  # Move toward player
	else:
		velocity = Vector3.ZERO  # Stop moving
		
	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta * 5

	move_and_slide()
