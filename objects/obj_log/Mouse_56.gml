/// @description check for a pathfind cancel

if !global.pause && !picked_up && global.targeted_object == id  && !hovered {
	global.targeted_object = noone;
	mp_grid_add_rectangle(obj_game_controller.grid, x - 7, y - 7, x + 7, y + 7);
	with targeting_beaver {
		targeted_log = noone;
	}
	targeting_beaver = noone;
}