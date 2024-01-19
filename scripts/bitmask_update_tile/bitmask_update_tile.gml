/// @function			bitmask_update_tile_cell(layer_id, x_cell, y_cell);
/// @description		Updates a tile given a tile layer and a cell xy coordinate
/// @param	{Id.Layer}	layer_id	the tile layer ID of the tile to update
/// @param	{real}		x_cell		the x-coordinate of the tile cell to check
/// @param	{real}		y_cell		the y-coordinate of the tile cell to check
function bitmask_update_tile_cell(layer_id, x_cell, y_cell) {
	var _map_id = layer_tilemap_get_id(layer_id);
	var _tile_width = tilemap_get_width(_map_id);
	var _tile_height = tilemap_get_height(_map_id);

	var _tile = tilemap_get(_map_id, x_cell, y_cell);
	if (!tile_get_empty(_tile)) {
		var _tile_mask = bitmask_check_tile(_map_id, x_cell, y_cell);
		bitmask_set_tile(_map_id, _tile, _tile_mask, x_cell, y_cell);
	}
}

/// @function			bitmask_update_tile(layer_id, x, y);
/// @description		Updates a tile given a tile layer and a cell xy coordinate
/// @param	{Id.Layer}	layer_id	the tile layer ID of the tile to update
/// @param	{real}		x			the x-coordinate of the tile to check
/// @param	{real}		y			the y-coordinate of the tile to check
function bitmask_update_tile(layer_id, x, y) {
	var _map_id = layer_tilemap_get_id(layer_id);
	var _tile_width = tilemap_get_width(_map_id);
	var _tile_height = tilemap_get_height(_map_id);
	
	x_cell = tilemap_get_cell_x_at_pixel(_map_id, x, y);
	y_cell = tilemap_get_cell_y_at_pixel(_map_id, x, y);
	
	var _tile = tilemap_get(_map_id, x_cell, y_cell);
	if (!tile_get_empty(_tile)) {
		var _tile_mask = bitmask_check_tile(_map_id, x_cell, y_cell);
		bitmask_set_tile(_map_id, _tile, _tile_mask, x_cell, y_cell);
	}
}