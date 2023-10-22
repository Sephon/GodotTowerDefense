extends RigidBody2D

var speed = 1 # Speed at which the enemy moves
var direction = Vector2(1, 1) # Direction in which the enemy moves (left in this case)
var player: CharacterBody2D
var TARGET_POINT = Vector2()
var MAP_BOUNDS = Rect2(Vector2(0, 0), Vector2(Global.MAP_SIZE_X, Global.MAP_SIZE_Y))  # Example bounds: from (0,0) to (800,600)

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_tree().get_nodes_in_group("Player")[0]
	set_new_target_point()
	pass # Replace with function body.

func set_new_target_point():
	TARGET_POINT.x = randf_range(MAP_BOUNDS.position.x, MAP_BOUNDS.position.x + MAP_BOUNDS.size.x)
	TARGET_POINT.y = randf_range(MAP_BOUNDS.position.y, MAP_BOUNDS.position.y + MAP_BOUNDS.size.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var distanceToPlayer = player.global_position.distance_to(global_position)
	var velocity
	var distance_to_waypoint = global_position.distance_to(TARGET_POINT)

	if(distanceToPlayer < 350): # ATTACK PLAYER
		var directionToPlayer = (player.global_position - global_position).normalized()
		velocity = directionToPlayer * speed
	else: # WALK TO WAYPOINT
		var currentDirection = (TARGET_POINT - global_position).normalized()
		velocity = currentDirection * speed
		
	var obj = $CollisionShape2D.shape as RectangleShape2D	
	if distance_to_waypoint < obj.size.x * 2  :
		set_new_target_point()	
	
	var result = move_and_collide(velocity)	
	print_debug(obj.size.x)
	pass
