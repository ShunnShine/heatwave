/// @description Pathfind to mouse

var _beaver_speed = 2;

var _num_tiles_x = 10;
var _num_tiles_y = 10;
var _tile_width = (room_width/_num_tiles_x);
var _tile_height = (room_height/_num_tiles_y);
var _target_tile = {
	x: mouse_x - mouse_x % _tile_width + _tile_width/2,
	y: mouse_y - mouse_y % _tile_height + _tile_height/2
}

path_to_mouse = path_add();
mp_grid_path(grid, path_to_mouse,
	x,
	y,
	_target_tile.x,
	_target_tile.y,
	false);
path_insert_point(path_to_mouse, 0, x, y, 100);
//mp_potential_path(path_to_mouse, mouse_x, mouse_y, _beaver_speed, 4, false);

path_start(path_to_mouse, _beaver_speed, path_action_stop, true);

walking = true;
