/// @description Build Water Bodies and Sand Depth Map

water_layer_id = layer_get_id("Water");
water_map_id = layer_tilemap_get_id(water_layer_id);

ground_layer_id = layer_get_id("Ground");
ground_map_id = layer_tilemap_get_id(ground_layer_id);

tile_width = tilemap_get_width(water_map_id);
tile_height = tilemap_get_height(water_map_id);

// Loop over all tiles. Put connecting water tiles into water bodies 
// and keep track all water bodies in this array
water_bodies = []
var _visited_water = new CoordinateMap();
for (var _x_cell = 0; _x_cell < tile_width; _x_cell++;) {
    for (var _y_cell = 0; _y_cell < tile_height; _y_cell++;) {
        var _tile = tilemap_get(water_map_id, _x_cell, _y_cell);
		if (tile_get_empty(_tile) || _visited_water.contains(_x_cell, _y_cell)) {
			continue;	
		}
		// start flood fill
		var _water_body = new WaterBody();
		var _queue = ds_queue_create();
		ds_queue_enqueue(_queue, {x:_x_cell, y:_y_cell});
		while !ds_queue_empty(_queue) {
			var _coords = ds_queue_dequeue(_queue);
			var _current_tile = tilemap_get(water_map_id, _coords.x, _coords.y);
			if (tile_get_empty(_current_tile) || _visited_water.contains(_coords.x, _coords.y)) {
				continue;
			}	
			_visited_water.add(_coords.x, _coords.y);
			_water_body.add(_coords.x, _coords.y);
			if _coords.x != 0 {
				ds_queue_enqueue(_queue, {x:_coords.x - 1, y:_coords.y})
			}
			if _coords.x != tile_width - 1 {
				ds_queue_enqueue(_queue, {x:_coords.x + 1, y:_coords.y})
			}
			if _coords.y != 0 {
				ds_queue_enqueue(_queue, {x:_coords.x, y:_coords.y - 1})
			}
			if _coords.y != tile_height - 1 {
				ds_queue_enqueue(_queue, {x:_coords.x, y:_coords.y + 1})
			}
		}
		ds_queue_destroy(_queue);
		array_push(water_bodies, _water_body);
    }
}
_visited_water.cleanup();

// build the sand_map, it assigns each sand tile not covered by ground with a depth
// the depth is calculated as the distance to the nearest ground tile
sand_map = new CoordinateMap();
var _sand_layer_queue = ds_queue_create();
for (var _x_cell = 0; _x_cell < tile_width; _x_cell++;) {
    for (var _y_cell = 0; _y_cell < tile_height; _y_cell++;) {
		var _tile = tilemap_get(ground_map_id, _x_cell, _y_cell);
		if (tile_get_empty(_tile)) {
				continue;
		}
		
		if	(_x_cell != 0				&& tile_get_empty(tilemap_get(ground_map_id, _x_cell - 1, _y_cell))) ||
			(_x_cell != tile_width - 1	&& tile_get_empty(tilemap_get(ground_map_id, _x_cell + 1, _y_cell))) ||
			(_y_cell != 0				&& tile_get_empty(tilemap_get(ground_map_id, _x_cell, _y_cell - 1))) ||
			(_y_cell != tile_height - 1 && tile_get_empty(tilemap_get(ground_map_id, _x_cell, _y_cell + 1))) {
			ds_queue_enqueue(_sand_layer_queue, {x:_x_cell, y:_y_cell});
		}
	}
}

var _visited_sand = new CoordinateMap(); 
var _next_queue = ds_queue_create();
var _depth = 0;

while !ds_queue_empty(_sand_layer_queue) {
	while !ds_queue_empty(_sand_layer_queue) {
		var _coords = ds_queue_dequeue(_sand_layer_queue);
		var _current_tile = tilemap_get(ground_map_id, _coords.x, _coords.y);
		if _visited_sand.contains(_coords.x, _coords.y) {
			continue;
		}
		_visited_sand.add(_coords.x, _coords.y);
		if _depth != 0 {
			sand_map.add(_coords.x, _coords.y, _depth);
			
			if tile_get_empty(tilemap_get(water_map_id, _coords.x, _coords.y)) {
				if  (_coords.x != 0	&& tile_get_empty(tilemap_get(water_map_id, _coords.x - 1, _coords.y))) {
					for(var i = 0; i < array_length(water_bodies); i++) {
						if water_bodies[i].contains(_coords.x - 1, _coords.y) {
							water_bodies[i].add_sand(_coords.x - 1, _coords.y, _depth);
						}
					}
				}
				if (_coords.x != tile_width - 1	&& tile_get_empty(tilemap_get(water_map_id, _coords.x + 1, _coords.y))) {
					for(var i = 0; i < array_length(water_bodies); i++) {
						if water_bodies[i].contains(_coords.x + 1, _coords.y) {
							water_bodies[i].add_sand(_coords.x + 1, _coords.y, _depth);
						}
					}
				}
				if (_coords.y != 0 && tile_get_empty(tilemap_get(water_map_id, _coords.x, _coords.y - 1))) {
					for(var i = 0; i < array_length(water_bodies); i++) {
						if water_bodies[i].contains(_coords.x, _coords.y - 1) {
							water_bodies[i].add_sand(_coords.x, _coords.y - 1, _depth);
						}
					}
				}
				if (_coords.y != tile_height - 1 && tile_get_empty(tilemap_get(water_map_id, _coords.x, _coords.y + 1))) {
					for(var i = 0; i < array_length(water_bodies); i++) {
						if water_bodies[i].contains(_coords.x, _coords.y + 1) {
							water_bodies[i].add_sand(_coords.x, _coords.y + 1, _depth);
						}
					}
				}
			}
		}
		
		if _coords.x != 0 {
			ds_queue_enqueue(_next_queue, {x:_coords.x - 1, y:_coords.y})
		}
		if _coords.x != tile_width - 1 {
			ds_queue_enqueue(_next_queue, {x:_coords.x + 1, y:_coords.y})
		}
		if _coords.y != 0 {
			ds_queue_enqueue(_next_queue, {x:_coords.x, y:_coords.y - 1})
		}
		if _coords.y != tile_height - 1 {
			ds_queue_enqueue(_next_queue, {x:_coords.x, y:_coords.y + 1})
		}
		if _coords.x != 0 && _coords.y != 0 {
			ds_queue_enqueue(_next_queue, {x:_coords.x - 1, y:_coords.y - 1})
		}
		if _coords.x != tile_width - 1 && _coords.y != tile_height - 1 {
			ds_queue_enqueue(_next_queue, {x:_coords.x + 1, y:_coords.y + 1})
		}
		if _coords.y != 0  && _coords.x != tile_width - 1{
			ds_queue_enqueue(_next_queue, {x:_coords.x + 1, y:_coords.y - 1})
		}
		if _coords.y != tile_height - 1 && _coords.x != 0 {
			ds_queue_enqueue(_next_queue, {x:_coords.x - 1, y:_coords.y + 1})
		}
	}
	var _temp = _sand_layer_queue;
	_sand_layer_queue = _next_queue;
	_next_queue = _temp;
	ds_queue_clear(_next_queue);
	_depth++;
}

ds_queue_destroy(_next_queue);
_visited_sand.cleanup();
ds_queue_destroy(_sand_layer_queue);


/// @function			add_water(_x_index, _y_index);
/// @description		places a water tile at the given location.
///						Merges and updates water bodies as nessessary.
///						WARNING*** Side effects change the water_bodies array making it unstable in a loop
/// @param	{real}	_x_index	the x-coordinate of the tile to add
/// @param	{real}	_y_index	the y-coordinate of the tile to add
add_water = function(_x_index, _y_index) {
	if !tile_get_empty(tilemap_get(water_map_id, _x_index, _y_index)) {
		exit;	
	}
	tilemap_set(water_map_id, 46, _x_index, _y_index);
	bitmask_update_tile_cell(water_layer_id, _x_index, _y_index);
	
	water_body = new WaterBody();
	water_body.add(_x_index, _y_index);
	check_neighbor = function(_neighbor_x, _neighbor_y) {
		if !tile_get_empty(tilemap_get(water_map_id, _neighbor_x, _neighbor_y)) {
			for (var i = 0; i < array_length(water_bodies); i++) {
				if water_bodies[i].contains(_neighbor_x, _neighbor_y) {
					water_body.merge(water_bodies[i]);
					array_delete(water_bodies, i, 1);
					break;	
				}
			}
		}
		else if tile_get_empty(tilemap_get(ground_map_id, _neighbor_x, _neighbor_y)) {
			water_body.add_sand(_neighbor_x, _neighbor_y, sand_map.get(_neighbor_x, _neighbor_y));
		}
	};
	foreach_neighbor(_x_index, _y_index, tile_width, tile_height, check_neighbor);
	array_push(water_bodies, water_body);
}

//init step count to be used in Step
step_count = 0