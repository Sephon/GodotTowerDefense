extends CharacterBody2D

var speed = 150 # Speed at which the enemy moves
var direction = Vector2(1, 1) # Direction in which the enemy moves (left in this case)

func _physics_process(delta):
	var currentPosition = position;
	var normal = get_floor_normal()
	self.floor_stop_on_slope = false
	self.slide_on_ceiling = false
	self.motion_mode = MOTION_MODE_FLOATING
	var motion = get_motion_mode()
	var velocity = direction * speed
	var result = move_and_slide()
	print_debug(result)
