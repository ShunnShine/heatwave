/// @description idle on path end

walking = false;

if targeted_log != noone && held_log == noone {
	with targeted_log picked_up = true;
	held_log = targeted_log;
	with(obj_log_placeholder) {
		show_log = true;
	}
}

if targeted_log == noone && held_log != noone {
	// place log
	// turn off log placeholder
}
