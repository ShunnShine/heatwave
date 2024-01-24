/// @description idle on path end

walking = false;

if targeted_log && !held_log {
	with targeted_log picked_up = true;
	held_log = targeted_log;
	with(obj_log_placeholder) {
		show_log = true;
	}
} else if held_log != noone {
	with held_log {
		picked_up = false;
		x -= x % global.tile_width;
		y -= y % global.tile_height - global.tile_height;
	}
	held_log = noone;
	with(obj_log_placeholder) {
		show_log = false;
	}
}
