/// @description pathfind to mouse

// this turns the cursor position into a tile
var _target_tile = {
	x: mouse_x - mouse_x % global.tile_width + global.tile_width/2,
	y: mouse_y - mouse_y % global.tile_height + global.tile_height/2
};

// gets the tile that is currently under the mouse position
selected_tile.x = tilemap_get_cell_x_at_pixel(ground_map_id, mouse_x, mouse_y);
selected_tile.y = tilemap_get_cell_y_at_pixel(ground_map_id, mouse_x, mouse_y);

if !global.pause && global.selected_beaver == id && !hovered {
	
	path_to_mouse = path_add();
	if mp_grid_path(obj_game_controller.grid, 
					path_to_mouse,
					x,
					y,
					_target_tile.x,
					_target_tile.y,
					false) 
	{
		path_start(path_to_mouse, beaver_speed, path_action_stop, true);

		walking = true;
	}
}