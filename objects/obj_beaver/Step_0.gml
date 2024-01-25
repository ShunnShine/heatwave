/// @description update sprites

//stops object if game is paused
if global.pause {
	path_speed = 0;
	image_speed = 0;
} else { 
	path_speed = beaver_speed;
	image_speed = 1 ;
}

//changes the sprite based on the direction the object is moving
if direction < 45 || direction >= 315 {
	image_xscale = 1;
	sprite_index = walking ? spr_beaver_sideview_walking : spr_beaver_sideview_idle;
	if (held_log) {
		with held_log {
			image_xscale = 1;
			sprite_index = spr_log_side;
			x_offset = -28;
			y_offset = -12;
		}
	}
}
else if direction < 135 {
	image_xscale = 1;
	sprite_index = walking ? spr_beaver_dumpy_walking : spr_beaver_dumpy_idle;
	if (held_log) {
		with held_log {
			image_xscale = 1;
			sprite_index = spr_log_front;
			x_offset = 0;
			y_offset = 18;
		}
	}
}
else if direction < 225 {
	image_xscale = -1;
	sprite_index = walking ? spr_beaver_sideview_walking : spr_beaver_sideview_idle;
	if (held_log) {
		with held_log {
			image_xscale = -1;
			sprite_index = spr_log_side;
			x_offset = 28;
			y_offset = -12;
		}
	}
}
else if direction < 315 {
	image_xscale = 1;
	sprite_index = walking ? spr_beaver_frontview_walking : spr_beaver_frontview_idle;
	if (held_log) {
		with held_log {
			image_xscale = -1;
			sprite_index = spr_log_front;
			x_offset = 0;
			y_offset = -36;
		}
	}
}
