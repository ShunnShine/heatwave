/// @description initialize selected tile variable

selected_tile = undefined;

/// @function			draw_tile_outline(_corner_x, _corner_y, _color)
/// @description		draws a square of the given color around a tile at the given location
/// @param	{real}	_corner_x	the x coordinate of the top left pixel of a tile
/// @param	{real}	_corner_y	the y coordinate of the top left pixel of a tile
/// @param	{Color}	_color		the color to draw the outline
draw_tile_outline = function(_corner_x, _corner_y, _color) {
	draw_primitive_begin(pr_linestrip);
	draw_vertex_colour(_corner_x	, _corner_y		, _color, 1);
	draw_vertex_colour(_corner_x	, _corner_y + 8	, _color, 1);
	draw_vertex_colour(_corner_x + 8, _corner_y + 8	, _color, 1);
	draw_vertex_colour(_corner_x + 8, _corner_y		, _color, 1);
	draw_vertex_colour(_corner_x	, _corner_y		, _color, 1);
	draw_primitive_end();
}