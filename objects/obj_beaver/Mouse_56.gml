/// @description Pathfind to mouse

var _tile_width = 8;
var _tile_height = 8;
var _num_tiles_x = (room_width/_tile_width);
var _num_tiles_y = (room_height/_tile_height);
var _target_tile = {
	x: mouse_x - mouse_x % _tile_width + _tile_width/2,
	y: mouse_y - mouse_y % _tile_height + _tile_height/2
}

if global.pause return;
if !selected return;

//find a way to prevent all of this code from running if the mouse was released over this object
path_to_mouse = path_add();
mp_grid_path(obj_game_controller.grid, path_to_mouse,
	x,
	y,
	_target_tile.x,
	_target_tile.y,
	false);
path_insert_point(path_to_mouse, 0, x, y, 100);

//if the clicked area doesn't have an object on it then move to location
//else move to a location and send a message on path end
path_start(path_to_mouse, beaver_speed, path_action_stop, true);

walking = true;