/// @description update sprites

//stops object if game is paused
if global.pause {
	path_speed = 0;
	image_speed = 0;
} else { 
	path_speed = beaver_speed;
	image_speed = animation_speed;
}

current_tile = tilemap_get_at_pixel(water_map_id, x, y);

if (current_tile) {
	swimming = true;
} else {
	swimming = false;
}

if(swimming) {
	//changes the water sprite based on the direction the object is moving
	if direction < 45 || direction >= 315 {
		image_xscale = 1;
		sprite_index = walking ? spr_beaver_sideview_swimming : spr_beaver_sideview_water_idle;
		if (held_log) {
			with held_log {
				image_xscale = 1;
				sprite_index = spr_log_side;
				x_offset = -32;
				y_offset = -12;
			}
		}
	}
	else if direction < 135 {
		image_xscale = 1;
		sprite_index = walking ? spr_beaver_dumpy_swimming: spr_beaver_dumpy_water_idle;
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
		sprite_index = walking ? spr_beaver_sideview_swimming: spr_beaver_sideview_water_idle;
		if (held_log) {
			with held_log {
				image_xscale = -1;
				sprite_index = spr_log_side;
				x_offset = 32;
				y_offset = -12;
			}
		}
	}
	else if direction < 315 {
		image_xscale = 1;
		sprite_index = walking ? spr_beaver_frontview_swimming: spr_beaver_frontview_water_idle;
		if (held_log) {
			with held_log {
				image_xscale = -1;
				sprite_index = spr_log_front;
				x_offset = 0;
				y_offset = -36;
			}
		}
	}
} else {
	//changes the land sprite based on the direction the object is moving
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
}
