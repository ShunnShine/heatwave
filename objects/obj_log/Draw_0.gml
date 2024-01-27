/// @description draw log/shader code

if picked_up {
	depth = targeting_beaver.depth - 1;
} else {
	depth = -y;
}

if !picked_up && hovered && !selected {
	draw_outline(id, global.hover_color);
} else if selected {
	draw_outline(id, global.selected_color);
} else {
	draw_self();
}
