extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	limit_left = 0
	limit_top = 0
	limit_bottom = Global.MAP_SIZE_Y
	limit_right = Global.MAP_SIZE_X
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
