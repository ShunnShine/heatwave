/// @function					bitmask_check_tile(tilemap, tile_x, tile_y);
/// @description				Checks tiles surrounding a given tile, used for bitmasking
/// @param	{Id.TileMapElement}	tilemap		Tilemap of the tile to be checked
/// @param	{real}				tile_x		X position of the tile to be checked
/// @param	{real}				tile_y		Y position of the tile to be checked
/// @return	{real}

function bitmask_check_tile(tilemap, tile_x, tile_y){
	_adj_tiles = {
		n : false,
		w : false,
		e : false,
		s : false,
		nw : false,
		ne : false,
		sw : false,
		se : false
	}; // stores the values of the surrounding tiles
	
	_tile_mask = 0; // index of the tileset to mask to the tile
	
	json = "{ \"254\": 45, \"90\": 22, \"22\": 7, \"0\": 47, \"10\": 3, \"2\": 1, \"94\": 48, \"120\": 29, \"11\": 4, \"208\": 34, \"107\": 28, \"82\": 19, \"216\": 37, \"86\": 20, \"223\": 41, \"214\": 36, \"104\": 26, \"222\": 40, \"74\": 16, \"18\": 6, \"8\": 2, \"248\": 42, \"255\": 46, \"127\": 33, \"123\": 31, \"66\": 14, \"16\": 5, \"219\": 39, \"75\": 17, \"80\": 18, \"122\": 30, \"30\": 11, \"126\": 32, \"31\": 12, \"250\": 43, \"88\": 21, \"64\": 13, \"95\": 25, \"251\": 44, \"91\": 49, \"24\": 8, \"27\": 10, \"218\": 38, \"72\": 15, \"106\": 27, \"26\": 9, \"210\": 35}"	
	_map = json_decode(json);
	
	// checks for the "empty" state of the adjacent tiles and sets the struct values accordingly
	if (!tile_get_empty(tilemap_get(tilemap, tile_x - 1, tile_y))) _adj_tiles.n = true;
	else _adj_tiles.n = false;
	
	if (!tile_get_empty(tilemap_get(tilemap, tile_x, tile_y - 1))) _adj_tiles.w = true;
	else _adj_tiles.w = false;
	
	if (!tile_get_empty(tilemap_get(tilemap, tile_x, tile_y + 1))) _adj_tiles.e = true;
	else _adj_tiles.e = false;
	
	if (!tile_get_empty(tilemap_get(tilemap, tile_x + 1, tile_y))) _adj_tiles.s = true;
	else _adj_tiles.s = false;
	
	// diagonal tile checks
	if (!tile_get_empty(tilemap_get(tilemap, tile_x - 1, tile_y - 1)) && _adj_tiles.w && _adj_tiles.n) _adj_tiles.nw = true;
	else _adj_tiles.nw = false;
	
	if (!tile_get_empty(tilemap_get(tilemap, tile_x - 1, tile_y + 1)) && _adj_tiles.n && _adj_tiles.e) _adj_tiles.ne = true;
	else _adj_tiles.ne = false;
	
	if (!tile_get_empty(tilemap_get(tilemap, tile_x + 1, tile_y - 1)) && _adj_tiles.s && _adj_tiles.w) _adj_tiles.sw = true;
	else _adj_tiles.sw = false;
	
	if (!tile_get_empty(tilemap_get(tilemap, tile_x + 1, tile_y + 1)) && _adj_tiles.s && _adj_tiles.e) _adj_tiles.se = true;
	else _adj_tiles.se = false;
	
	// uses binary directional values to combine the values of the adjacent tiles, and returns an index value
	_tile_mask = _adj_tiles.nw + 2 * _adj_tiles.n + 4 * _adj_tiles.ne + 8 * _adj_tiles.w + 16 * _adj_tiles.e + 32 * _adj_tiles.sw + 64 * _adj_tiles.s + 128 * _adj_tiles.se;
	
	_tile_mask = ds_map_find_value(_map, string(_tile_mask));

	ds_map_destroy(_map);
	return _tile_mask;
}