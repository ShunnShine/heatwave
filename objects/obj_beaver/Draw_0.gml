/// @description draw beaver/shader code

depth = -y;

//checks that this object is being hovered, this object is not currently selected, and the game is not paused
if hovered && global.selected_beaver != id && !global.pause {
	draw_outline(id, global.hover_color);
}
else if global.selected_beaver == id { // if the object is selected, this will change the shader to green
	draw_outline(id, global.selected_color);
} else { // THIS DRAWS THE SPRITE, MAKE SURE THIS IS ALWAYS REACHABLE
	draw_self();
}