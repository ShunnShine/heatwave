/// @description pathfind to mouse

// this turns the cursor position into the 
var _target_tile = {
	x: mouse_x - mouse_x % global.tile_width + global.tile_width/2,
	y: mouse_y - mouse_y % global.tile_height + global.tile_height/2
}

if !global.pause && global.selected_object == id && !hovered {
	
	path_to_mouse = path_add();
	if mp_grid_path(obj_game_controller.grid, path_to_mouse,
		x,
		y,
		_target_tile.x,
		_target_tile.y,
		false) {
		path_start(path_to_mouse, beaver_speed, path_action_stop, true);

		walking = true;
		}
}