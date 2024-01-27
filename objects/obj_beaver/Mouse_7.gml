/// @description select this beaver

if (global.selected_beaver == id) {
	camera_set_view_target(global.camera, id);
	instance_destroy(global.camera_move_object);
	global.camera_move_object = noone;
}

global.selected_beaver = id

if (held_log) {
	with obj_log_placeholder show_log = true;
} else {
	with obj_log_placeholder show_log = false;
}
	