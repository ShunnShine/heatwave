/// @description Pathfind to mouse

path_to_mouse = path_add();
var _beaver_speed = 2;
mp_potential_path(path_to_mouse, mouse_x, mouse_y, _beaver_speed, 4, false);
path_start(path_to_mouse, _beaver_speed, path_action_stop, true);
draw_path(path_to_mouse, x, y, false);