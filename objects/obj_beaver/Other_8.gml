/// @description idle on path end

walking = false;

if !targeted_log && !held_log && selected_tile.tiledata != 0 {
	tilemap_set(map_id, 0, selected_tile.x, selected_tile.y);
	bitmask_update_tile_cell(lay_id, selected_tile.x, selected_tile.y, false);
	
	selected_tile.tiledata = 0;
	selected_tile.x = 0;
	selected_tile.y = 0;
}

if targeted_log && !held_log {
	with targeted_log picked_up = true;
	held_log = targeted_log;
	with(obj_log_placeholder) {
		show_log = true;
	}
} else if held_log != noone {
	with held_log {
		picked_up = false;
		x -= x % global.tile_width + x_offset;
		y -= y % global.tile_height - global.tile_height;
	}
	held_log = noone;
	with(obj_log_placeholder) {
		show_log = false;
	}
}
