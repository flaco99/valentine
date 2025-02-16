extends CharacterBody3D

@export var speed: float = 5.0  # Movement speed
@export var jump_force: float = 5.0  # Jump strength
var gravity: float = 9.8  # Gravity value

func _physics_process(delta):
	var direction = Vector3.ZERO
	
	# Get player input
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	if Input.is_action_pressed("move_backward"):
		direction.z += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	
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
