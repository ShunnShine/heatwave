// Not as useful as I thought it would be because anonymous functions aren't able to capture outside variables
function foreach_neighbor(_x_index, _y_index, _width, _height, _callback, _extras){
	if _extras != undefined {
		if _x_index != 0 {
			_callback(_x_index - 1, _y_index, _extras);
		}
		if _x_index != tile_width - 1 {
			_callback(_x_index + 1, _y_index, _extras);
		}
		if _y_index != 0 {
			_callback(_x_index, _y_index - 1, _extras);
		}
		if _y_index != tile_height - 1 {
			_callback(_x_index, _y_index + 1, _extras);
		}
	}
	else {
		if _x_index != 0 {
			_callback(_x_index - 1, _y_index);
		}
		if _x_index != tile_width - 1 {
			_callback(_x_index + 1, _y_index);
		}
		if _y_index != 0 {
			_callback(_x_index, _y_index - 1);
		}
		if _y_index != tile_height - 1 {
			_callback(_x_index, _y_index + 1);
		}
	}
}