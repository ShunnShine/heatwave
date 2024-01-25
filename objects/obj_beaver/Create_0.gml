/// @description initialize instance variables

ground_lay_id = layer_get_id("Ground");
ground_map_id = layer_tilemap_get_id(ground_lay_id);
water_lay_id = layer_get_id("Water");
water_map_id = layer_tilemap_get_id(water_lay_id);
selected_tile = {
	x: 0,
	y: 0
};



//this is where the beaver pathing is stored
path_to_mouse = noone;

// targeted log is the log that the beaver wants to pickup, but has not reached
targeted_log = noone;

// held log is the log that the beaver is currently carrying
held_log = noone;

hovered = false;

walking = false;
swimming = false;
beaver_speed = 1;
animation_speed = beaver_speed / 1.25;