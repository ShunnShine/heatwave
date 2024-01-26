/// @description Check Producers and Consumers and Then update water bodies

// naive way to slow down water production (its adjustable)
if step_count != 1 {
	step_count++;
	exit;
}
step_count = 0

//run all water producers - They each add one growth_pressure to the body they're in.
with (obj_water_producer) {
	var _x_cell = tilemap_get_cell_x_at_pixel(other.water_map_id, x, y);
	var _y_cell = tilemap_get_cell_y_at_pixel(other.water_map_id, x, y);
	var _tile_data = tilemap_get(other.water_map_id, _x_cell, _y_cell);
	if tile_get_empty(_tile_data) {
		other.add_water(_x_cell, _y_cell);
	}
	else {
		for (var i = 0; i < array_length(other.water_bodies); i++) {
			if other.water_bodies[i].contains(_x_cell, _y_cell) {
				other.water_bodies[i].growth_pressure++;
			}
		}
	}
}

//run all water consumers - They each subtract one growth_pressure to the body they're in.
with (obj_water_consumer) {
	var _x_cell = tilemap_get_cell_x_at_pixel(other.water_map_id, x, y);
	var _y_cell = tilemap_get_cell_y_at_pixel(other.water_map_id, x, y);
	var _tile_data = tilemap_get(other.water_map_id, _x_cell, _y_cell);
	if !tile_get_empty(_tile_data) {
		for (var i = 0; i < array_length(other.water_bodies); i++) {
			if other.water_bodies[i].contains(_x_cell, _y_cell) {
				other.water_bodies[i].growth_pressure--;
			}
		}
	}
}

//loop over the water_bodies and make them grow or shrink according to their growth_pressure
//I did this weird while(true) loop becuase add_water can change water_bodies making the for loop unstable
while(true) {
	var _something_happened = false;
	for (var i = 0; i < array_length(water_bodies); i++) {
		if water_bodies[i].growth_pressure > 0 {
			var _coords = water_bodies[i].next_sand();
			if _coords == 0 {
				water_bodies[i].growth_pressure = 0;
				continue;	
			}
			water_bodies[i].growth_pressure--;
			add_water(_coords.x, _coords.y);
			_something_happened = true;
			break;
		}
		else if water_bodies[i].growth_pressure < 0 {
			//TODO: Implement water_shrinking
			water_bodies[i].growth_pressure = 0
		}
	}
	if _something_happened == false {
		break;	
	}
}