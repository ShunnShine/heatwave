/// @description draw log/shader code

if hovered && global.targeted_object != id && !global.pause {
	draw_outline(id, global.hover_color);
}
else if global.targeted_object == id {
	draw_outline(id, global.selected_color);
} else {
	draw_self();
}






