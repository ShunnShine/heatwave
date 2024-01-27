/// @description Camera zoom in

if global.camera_width > 360
	camera_set_view_size(global.camera, 
	global.camera_width - global.camera_zoom_speed * 1.78, 
	global.camera_height - global.camera_zoom_speed);

global.camera_width = camera_get_view_width(global.camera);
global.camera_height = camera_get_view_height(global.camera);
camera_set_view_border(global.camera, global.camera_width / 2, global.camera_height / 2);