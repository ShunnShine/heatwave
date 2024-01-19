/// @description Insert description here

tilemap_set_at_pixel(map_id, 46, mouse_x, mouse_y);
bitmask_update_tile(layer_id, mouse_x, mouse_y);



// update surrounding tiles
bitmask_update_tile(layer_id, mouse_x, mouse_y - 8); // north
bitmask_update_tile(layer_id, mouse_x, mouse_y + 8); // south
bitmask_update_tile(layer_id, mouse_x + 8, mouse_y); // east
bitmask_update_tile(layer_id, mouse_x - 8, mouse_y); // west
	
bitmask_update_tile(layer_id, mouse_x - 8, mouse_y - 8); // northwest
bitmask_update_tile(layer_id, mouse_x + 8, mouse_y - 8); // northeast
bitmask_update_tile(layer_id, mouse_x - 8, mouse_y + 8); // southwest
bitmask_update_tile(layer_id, mouse_x + 8, mouse_y + 8); // southeast