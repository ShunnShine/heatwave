/// @description Pathfind to mouse

var _beaver_speed = 2;

var _tile_width = 8;
var _tile_height = 8;
var _num_tiles_x = (room_width/_tile_width);
var _num_tiles_y = (room_height/_tile_height);
var _target_tile = {
	x: mouse_x - mouse_x % _tile_width + _tile_width/2,
	y: mouse_y - mouse_y % _tile_height + _tile_height/2
}

path_to_mouse = path_add();
mp_grid_path(obj_grid_controller.grid, path_to_mouse,
	x,
	y,
	_target_tile.x,
	_target_tile.y,
	false);
path_insert_point(path_to_mouse, 0, x, y, 100);
//mp_potential_path(path_to_mouse, mouse_x, mouse_y, _beaver_speed, 4, false);

//if the clicked area doesn't have an object on it then move to location
//else move to a location and send a message on path end
path_start(path_to_mouse, _beaver_speed, path_action_stop, true);

walking = true;