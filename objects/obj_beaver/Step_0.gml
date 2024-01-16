/// @description rotate to movement

if global.pause path_speed = 0;
else path_speed = beaver_speed;

if direction < 45 || direction >= 315 {
	image_xscale = 1;
	sprite_index = walking ? spr_beaver_sideview_walking : spr_beaver_sideview_idle;

}
else if direction < 135 {
	image_xscale = 1;
	sprite_index = walking ? spr_beaver_dumpy_walking : spr_beaver_dumpy_idle;
}
else if direction < 225 {
	image_xscale = -1;
	sprite_index = walking ? spr_beaver_sideview_walking : spr_beaver_sideview_idle;
}
else if direction < 315 {
	image_xscale = 1;
	sprite_index = walking ? spr_beaver_frontview_walking : spr_beaver_frontview_idle;
}
