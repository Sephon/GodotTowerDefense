extends Node

var tile_map: TileMap 
var tile_size: int = 32  # or whatever size your tiles are
var map_width: int = 400
var map_height: int = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map = $TileMap
	generate_map()
	pass # Replace with function body.
	
func weighted_random_tile():
# A simple weighted distribution where 0 has a 50% chance, 
# and 1, 2, and 3 each have a 16.67% chance.
	var weights = [0.8, 0.0667, 0.0667, 0.0667]
	var sum_weights = 0.0
	for weight in weights:
		sum_weights += weight
	var rand_num = randf() * sum_weights
	var cumulative_weight = 0.0
	for index in range(weights.size()):
		cumulative_weight += weights[index]
		if rand_num < cumulative_weight:
			return index
	return weights.size() - 1  # Default to the last index if no other match

func generate_map():
	for x in range(map_width):
		for y in range(map_height):
			var tile_index = weighted_random_tile()
			tile_map.set_cell(0, Vector2i(x,y), 0, Vector2i(tile_index,0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
