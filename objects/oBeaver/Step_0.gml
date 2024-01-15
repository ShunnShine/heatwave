/// @description rotate to movement

if direction < 45 || direction >= 315 {
	image_xscale = 1;
	sprite_index = walking ? Beaver_Sideview_Walking : Beaver_Sideview_Idle;

}
else if direction < 135 {
	image_xscale = 1;
	sprite_index = walking ? Beaver_Dumpy_Walking : Beaver_Dumpy_Idle;
}
else if direction < 225 {
	image_xscale = -1;
	sprite_index = walking ? Beaver_Sideview_Walking : Beaver_Sideview_Idle;
}
else if direction < 315 {
	image_xscale = 1;
	sprite_index = walking ? Beaver_Frontview_Walking : Beaver_Frontview_Idle;
}
