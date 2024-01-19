/// @description Insert description here
// You can write your code in this editor

var _lay_id = layer_get_id("Water");
var _map_id = layer_tilemap_get_id(_lay_id);
var _tile_width = tilemap_get_width(_map_id);
var _tile_height = tilemap_get_height(_map_id);

var _x_cell = tilemap_get_cell_x_at_pixel(_map_id, mouse_x, mouse_y);
var _y_cell = tilemap_get_cell_y_at_pixel(_map_id, mouse_x, mouse_y);
var _tile = tilemap_get(_map_id, _x_cell, _y_cell);
if (!tile_get_empty(_tile)) {
	var _tile_mask = bitmask_check_tile(_map_id, _x_cell, _y_cell);
	bitmask_set_tile(_map_id, _tile, _tile_mask, _x_cell, _y_cell);
}

