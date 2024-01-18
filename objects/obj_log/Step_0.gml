/// @description Check if picked up, and if true, set position to the beaver's position

if targeting_beaver && picked_up {
	
	x = targeting_beaver.x;
	y = targeting_beaver.y - 12;
}