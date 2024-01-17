/// @description select this beaver

if global.pause return;

global.selected_beaver = id;
camera_set_view_target(global.camera, id);
instance_destroy(global.camera_move_object);
global.camera_move_object = noone;