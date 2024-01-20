/// @description Draw Square on hovered tile

if global.selected_beaver == noone {
	exit;
}

var _corner_x = mouse_x - mouse_x % global.tile_width;
var _corner_y = mouse_y - mouse_y % global.tile_height;
var _color = make_color_rgb(global.hover_color[0] * 255,
							global.hover_color[1] * 255,
							global.hover_color[2] * 255);

draw_tile_outline(_corner_x, _corner_y, _color);


