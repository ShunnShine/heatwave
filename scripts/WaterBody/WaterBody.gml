// abstraction for a bunch of connecting water tiles next to eachother
function WaterBody() : CoordinateMap() constructor {
	priority_sand = ds_priority_create();
	growth_pressure = 0;
	
	static map_cleanup = cleanup;
	static cleanup = function() {
		map_cleanup();
		ds_priority_destroy(priority_sand);
	}
	
	static map_merge = merge;
	static merge = function(_other_water_body) {
		if self == _other_water_body {
			exit;	
		}
		map_merge(_other_water_body);
		
		growth_pressure += _other_water_body.growth_pressure;
		while !ds_priority_empty(_other_water_body.priority_sand) {
			var _max = ds_priority_find_max(_other_water_body.priority_sand);
			var _depth = ds_priority_find_priority(_other_water_body.priority_sand, _max);
			ds_priority_add(priority_sand, _max, _depth);
			ds_priority_delete_max(_other_water_body.priority_sand);
		}
		
		ds_priority_destroy(_other_water_body.priority_sand);
	}
	
	/// @function			add_sand(_x_index, _y_index, _depth);
	/// @description		Adds the given coordinates as a neighboring sand tile
	/// @param	{real}	_x_index	the x-coordinate of the tile to add
	/// @param	{real}	_y_index	the y-coordinate of the tile to add
	/// @param	{real}	_depth		the depth of the tile to add
	static add_sand = function(_x_index, _y_index, _depth) {
		ds_priority_add(priority_sand, {x:_x_index, y:_y_index}, _depth);
	}
	
	/// @function			next_sand(_x_index, _y_index, _depth);
	/// @description		Removes the deepest neighboring sand tile and returns it.
	/// @returns			A struct containing the x and y indexes of the deepest neighboring sand tile
	static next_sand = function() {
		return ds_priority_delete_max(priority_sand);
	}
}