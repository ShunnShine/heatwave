/// @description Pathfind to mouse

var _beaver_speed = 2;

path_to_mouse = path_add();
mp_grid_path(grid, path_to_mouse, x, y, 
	mouse_x - mouse_x % (room_width/10) + (room_width/10)/2, 
	mouse_y - mouse_y % (room_height/10) + (room_height/10)/2,
	false);
//mp_potential_path(path_to_mouse, mouse_x, mouse_y, _beaver_speed, 4, false);

path_start(path_to_mouse, _beaver_speed, path_action_stop, true);

walking = true;
