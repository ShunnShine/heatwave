/// @function					bitmask_set_tile(tilemap, tiledata, tile_index, tile_x, tile_y);
/// @description				Sets tiles to the proper tile sprite based on the bitmasking index
/// @param {Id.TileMapElement}	tilemap		tilemap of the tile to be set
/// @param {real}				tiledata	Tiledata of the tile to be set
/// @param {real}				tile_index	Index of the tileset to set the tile to, can be found using bitmask_check_tile();
/// @param {real}				tile_x		X position of the tile to be set
/// @param {real}				tile_y		Y position of the tile to be set

function bitmask_set_tile(tilemap, tiledata, tile_index, tile_x, tile_y) {
	tiledata = tile_set_index(tiledata, tile_index);
	tilemap_set(tilemap, tiledata, tile_x, tile_y);
}