/// @description idle on path end

walking = false;

if !targeted_log && !held_log && selected_tile.x != 0 && selected_tile.y != 0 {
	tilemap_set(ground_map_id, 0, selected_tile.x, selected_tile.y);
	bitmask_update_tile_cell(ground_lay_id, selected_tile.x, selected_tile.y, false);
	
	selected_tile.x = 0;
	selected_tile.y = 0;
}

if /*!swimming &&*/ targeted_log && !held_log {
	with targeted_log picked_up = true;
	held_log = targeted_log;
	with(obj_log_placeholder) {
		show_log = true;
	}
} else if /*!swimming &&*/ held_log != noone {
	with held_log {
		picked_up = false;
		x -= x % global.tile_width + x_offset;
		y -= y % global.tile_height - global.tile_height;
		
		var _tiles = [[x - 12, y - 4],
						[x - 4, y - 4],
						[x + 4, y - 4],
						[x + 12, y - 4],
						[x - 12, y + 4],
						[x - 4, y + 4],
						[x + 4, y + 4],
						[x + 12, y + 4]];
		for(var i = 0; i < array_length(_tiles); i++) {
			tilemap_set_at_pixel(other.water_map_id, 0, _tiles[i][0], _tiles[i][1]);
			bitmask_update_tile(other.water_lay_id, _tiles[i][0],  _tiles[i][1]);
		}
	}
	held_log = noone;
	with(obj_log_placeholder) {
		show_log = false;
	}
}
