/// @description check for a pathfind cancel

if !global.pause && global.targeted_object == id  && !hovered {
	global.targeted_object = noone;
	mp_grid_add_rectangle(obj_game_controller.grid, x, y + 8, x + 26, y + 16);
}