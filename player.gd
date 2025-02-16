extends CharacterBody3D

@export var speed: float = 5.0  # Movement speed
@export var jump_force: float = 5.0  # Jump strength
@export var rotation_speed: float = 2.0  # Rotation speed
var gravity: float = 9.8  # Gravity value

func _physics_process(delta):
	var direction = Vector3.ZERO

	# Rotate character left and right with arrow keys
	if Input.is_action_pressed("move_left"):
		rotate_y(deg_to_rad(rotation_speed))  # Rotate right
	if Input.is_action_pressed("move_right"):
		rotate_y(deg_to_rad(-rotation_speed))  # Rotate left

	# Get player movement input (relative to character's rotation)
	if Input.is_action_pressed("move_forward"):
		direction -= transform.basis.z  # Move forward in facing direction
	if Input.is_action_pressed("move_backward"):
		direction += transform.basis.z  # Move backward in facing direction

	# Normalize direction for smooth diagonal movement
	direction = direction.normalized()

	# Apply movement
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	# Apply gravity
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Jumping
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force

	move_and_slide()
