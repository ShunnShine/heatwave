/// @description initialize instance variables

lay_id = layer_get_id("Ground");
map_id = layer_tilemap_get_id(lay_id);
selected_tile = {
	tiledata: 0,
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
beaver_speed = 2;