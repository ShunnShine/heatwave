/// @description Check if picked up, and if true, set position to the beaver's position

if targeting_beaver && picked_up {
	selected = false;
	x = targeting_beaver.x + x_offset;
	y = targeting_beaver.y + y_offset;
}