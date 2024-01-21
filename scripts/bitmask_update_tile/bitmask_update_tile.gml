/// @function			bitmask_update_tile_cell(layer_id, x_cell, y_cell);
/// @description		Updates a tile given a tile layer and a cell xy coordinate
/// @param	{Id.Layer}	layer_id	the tile layer ID of the tile to update
/// @param	{real}		x_cell		the x-coordinate of the tile cell to check
/// @param	{real}		y_cell		the y-coordinate of the tile cell to check
/// @param	{bool}		[singular]	whether or not the function should update surrounding tiles
function bitmask_update_tile_cell(layer_id, x_cell, y_cell, singular) {
	var _map_id = layer_tilemap_get_id(layer_id);
	
	if(!singular) {
		for(var _x_offset = -1; _x_offset <= 1; _x_offset++;) {
			for(var _y_offset = -1; _y_offset <= 1; _y_offset++;) {
				var _tile = tilemap_get(_map_id, x_cell + _x_offset, y_cell + _y_offset);
				if (!tile_get_empty(_tile)) {
					var _tile_mask = bitmask_check_tile(_map_id, x_cell + _x_offset, y_cell + _y_offset);
					bitmask_set_tile(_map_id, _tile, _tile_mask, x_cell + _x_offset, y_cell + _y_offset);
				}
			}
		}
	} else {
		var _tile = tilemap_get(_map_id, x_cell, y_cell);
		if (!tile_get_empty(_tile)) {
			var _tile_mask = bitmask_check_tile(_map_id, x_cell, y_cell);
			bitmask_set_tile(_map_id, _tile, _tile_mask, x_cell, y_cell);
		}
	}
}

/// @function			bitmask_update_tile(layer_id, x, y);
/// @description		Updates a tile given a tile layer and a cell xy coordinate
/// @param	{Id.Layer}	layer_id	the tile layer ID of the tile to update
/// @param	{real}		x			the x-coordinate of the tile to check
/// @param	{real}		y			the y-coordinate of the tile to check
/// @param	{bool}	[singular]	whether or not the function should update surrounding tiles
function bitmask_update_tile(layer_id, x, y, singular) {
	var _map_id = layer_tilemap_get_id(layer_id);
	
	x_cell = tilemap_get_cell_x_at_pixel(_map_id, x, y);
	y_cell = tilemap_get_cell_y_at_pixel(_map_id, x, y);
	
	if(!singular) {
		for(var _x_offset = -1; _x_offset <= 1; _x_offset++;) {
			for(var _y_offset = -1; _y_offset <= 1; _y_offset++;) {
				var _tile = tilemap_get(_map_id, x_cell + _x_offset, y_cell + _y_offset);
				if (!tile_get_empty(_tile)) {
					var _tile_mask = bitmask_check_tile(_map_id, x_cell + _x_offset, y_cell + _y_offset);
					bitmask_set_tile(_map_id, _tile, _tile_mask, x_cell + _x_offset, y_cell + _y_offset);
				}
			}
		}
	} else {
		var _tile = tilemap_get(_map_id, x_cell, y_cell);
		if (!tile_get_empty(_tile)) {
			var _tile_mask = bitmask_check_tile(_map_id, x_cell, y_cell);
			bitmask_set_tile(_map_id, _tile, _tile_mask, x_cell, y_cell);
		}
	}
}