// a dictionary that takes in two integers as the keys
function CoordinateMap() constructor {
	count = 0;
	x_map = ds_map_create();
	
	/// @function			contains(_x_index, _y_index);
	/// @description		Returns true of the coordinates are in the map, false otherwise
	/// @param	{real}	_x_index	the x-coordinate of the tile to check
	/// @param	{real}	_y_index		the y-coordinate of the tile to check
	/// @returns {Bool}
	static contains = function(_x_index, _y_index) {
		if !ds_map_exists(x_map, _x_index) {
			return false;
		}
		return ds_map_exists(x_map[? _x_index], _y_index);
	}
	
	/// @function			get(_x_index, _y_index);
	/// @description		Returns the value of the coordinates in the map, undefined otherwise
	/// @param	{real}	_x_index	the x-coordinate of the tile to get
	/// @param	{real}	_y_index		the y-coordinate of the tile to get
	/// @returns {Any}
	static get = function(_x_index, _y_index) {
		if !ds_map_exists(x_map, _x_index) || !ds_map_exists(x_map[? _x_index], _y_index){
			return undefined;
		}
		return x_map[? _x_index][? _y_index];
	}
	
	/// @function			add(_x_index, _y_index);
	/// @description		Adds the coordinates to the map if they arent already added
	/// @param	{real}	_x_index	the x-coordinate of the tile to add
	/// @param	{real}	_y_index		the y-coordinate of the tile to add
	/// @param	{Any}	_value		the value to save at the given coordinates. Defaults to true
	static add = function(_x_index, _y_index, _value = true) {
		if !ds_map_exists(x_map, _x_index) {
			ds_map_add_map(x_map, _x_index, ds_map_create());
		}
		if ds_map_add(x_map[? _x_index], _y_index, _value) {
		count++;
		}
	}
	
	/// @function			remove(_x_index, _y_index);
	/// @description		If the coords exist in the map, remove those coords
	/// @param	{real}	_x_index	the x-coordinate of the tile to remove
	/// @param	{real}	_y_index		the y-coordinate of the tile to remove
	static remove = function(_x_index, _y_index) {
		if !ds_map_exists(x_map, _x_index) {
			exit;
		}
		if !ds_map_exists(x_map[? _x_index], _y_index) {
			exit;
		}
		ds_map_delete(x_map[? _x_index], _y_index);
		count--;
		if ds_map_empty(x_map[? _x_index]) {
			ds_map_destroy(x_map[? _x_index]);
			ds_map_delete(x_map, _x_index);
		}
	}
	
	/// @function			merge(_other_map);
	/// @description		Merges the passed in coordinate map into this one, and destroys the old one.
	/// @param	{real}	_other_map	the water body to merge with this one
	static merge = function(_other_map) {
		if self = _other_map {
			exit;
		}
		
		for (var _x_index = ds_map_find_first(_other_map.x_map); !is_undefined(_x_index); _x_index = ds_map_find_next(_other_map.x_map, _x_index)) {
			var _y_map = _other_map.x_map[? _x_index];
			for (var _y_index = ds_map_find_first(_y_map); !is_undefined(_y_index); _y_index = ds_map_find_next(_y_map, _y_index)) {
				add(_x_index, _y_index, _y_map[? _y_index]);
			}
		}
		
		ds_map_destroy(_other_map.x_map);
	}
	
	/// @function			cleanup();
	/// @description		Deletes memory resources used by this struct
	static cleanup = function() {
		ds_map_destroy(x_map);
	}
}