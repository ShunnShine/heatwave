/// @description check for a pathfind cancel

if !picked_up && targeting_beaver && !hovered {
	mp_grid_add_rectangle(obj_game_controller.grid, x - 7, y - 7, x + 7, y + 7);
	selected = false;
	with targeting_beaver {
		targeted_log = noone;
	}
	targeting_beaver = noone;
}