// defines the layers to run the autotile for at the creation of the room
layers = ["Water", "Ground"];

// runs the autotile for each layer in the array
for (var i = 0; i < array_length(layers); i++;) {
	layer_id = layer_get_id(layers[i]);
	map_id = layer_tilemap_get_id(layer_id);
	tile_width = tilemap_get_width(map_id);
	tile_height = tilemap_get_height(map_id);
	
	// checks every single cell in each iteration's layer
	for (var _x_cell = 0; _x_cell < tile_width; _x_cell++;) {
		for (var _y_cell = 0; _y_cell < tile_height; _y_cell++;) {
			
			// super ez function made by yours truly to autotile 
			// (gamemaker this was coded by an 18 year old in a few days why is 
			// this feature not in the IDE by default)
			bitmask_update_tile_cell(layer_id, _x_cell, _y_cell, true);
		}
	}
}