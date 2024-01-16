/// @description Insert description here
var _x = x;
var _y = y;

if global.selected_object != noone
	mp_grid_clear_rectangle(obj_game_controller.grid, x, y + 8, x + 32, y + 16);

with (global.selected_object) {
	//find a way to prevent all of this code from running if the mouse was released over this object
	path_to_mouse = path_add();
	mp_grid_path(obj_game_controller.grid, path_to_mouse,
		x,
		y,
		_x,
		_y,
		false);
	path_insert_point(path_to_mouse, 0, x, y, 100);

	//if the clicked area doesn't have an object on it then move to location
	//else move to a location and send a message on path end
	path_start(path_to_mouse, beaver_speed, path_action_stop, true);

	walking = true;
}






