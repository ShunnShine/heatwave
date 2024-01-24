/// @description draw transparent log with outline
if !show_log {
	exit;
}

var _outline_color = place_meeting(x, y, [obj_beaver, obj_log]) ? [1, 0, 0, 1] : [0, 1, 0, 1];

draw_outline(id, _outline_color);