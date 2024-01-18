/// @function					bitmask_check_tile(tilemap, tiledata, tile_x, tile_y);
/// @description				Checks tiles surrounding a given tile, used for bitmasking
/// @param	{Id.TileMapElement}	tilemap		Tilemap of the tile to be checked
/// @param	{real}				tiledata	Tiledata of the tile to be checked
/// @param	{real}				tile_x		X position of the tile to be checked
/// @param	{real}				tile_y		Y position of the tile to be checked
/// @return	{real}

function bitmask_check_tile(tilemap, tiledata, tile_x, tile_y){
	_adj_tiles = {
		n : 0,
		w : 0,
		e : 0,
		s : 0
	} // stores the values of the surrounding tiles
	
	_tile_mask = 0; // index of the tileset to mask to the tile
	
	// checks for the "empty" state of the adjacent tiles and sets the struct values accordingly
	if (tile_get_empty(tilemap_get(tilemap, tile_x - 1, tile_y))) _adj_tiles.n = 0;
	else _adj_tiles.n = 1;
	
	if (tile_get_empty(tilemap_get(tilemap, tile_x, tile_y - 1))) _adj_tiles.w = 0;
	else _adj_tiles.w = 1;
	
	if (tile_get_empty(tilemap_get(tilemap, tile_x, tile_y + 1))) _adj_tiles.e = 0;
	else _adj_tiles.e = 1;
	
	if (tile_get_empty(tilemap_get(tilemap, tile_x + 1, tile_y))) _adj_tiles.s = 0;
	else _adj_tiles.s = 1;
	
	// uses binary directional values to combine the values of the adjacent tiles, and returns an index value
	_tile_mask = 1 * _adj_tiles.n + 2 * _adj_tiles.w + 4 * _adj_tiles.e + 8 * _adj_tiles.s;
	
	
	return _tile_mask;
}