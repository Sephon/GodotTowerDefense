extends CharacterBody2D

@onready var CAMERA = $Camera2D

const SPEED = 150.0
const VELOCITY = Vector2()
var sprint_multiplier = 2.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	velocity = Vector2()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
		

	velocity = velocity.normalized() * SPEED

	if Input.is_action_pressed("ui_shift"):
		velocity *= sprint_multiplier

		
	# Check against camera boundaries
	var next_position = position + velocity * delta
	if next_position.x < $Camera2D.limit_left:
		velocity.x += 1
	elif next_position.x > $Camera2D.limit_right:
		velocity.x -= 1
	if next_position.y < $Camera2D.limit_top:
		velocity.y += 1
	elif next_position.y > $Camera2D.limit_bottom:
		velocity.y -= 1
		
	move_and_slide()

#func _physics_process(delta):
#	# Add the gravity.
#	if not is_on_floor():
#		velocity.y += gravity * delta
#
#	# Handle Jump.
#	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
#		velocity.y = JUMP_VELOCITY
#
#	# Get the input direction and handle the movement/deceleration.
#	# As good practice, you should replace UI actions with custom gameplay actions.
#	var direction = Input.get_axis("ui_left", "ui_right")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)
#
#	move_and_slide()
