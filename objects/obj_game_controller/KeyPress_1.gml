/// @description Unfocus camera on any key press

if global.camera_move_object == noone {
	global.camera_move_object = instance_create_layer(
		global.selected_beaver.x, global.selected_beaver.y, layer, obj_camera_free_movement);
	camera_set_view_target(global.camera, global.camera_move_object);
}