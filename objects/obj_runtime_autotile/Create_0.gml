layer_id = layer_get_id("Water");
map_id = layer_tilemap_get_id(layer_id);
tile_width = tilemap_get_width(map_id);
tile_height = tilemap_get_height(map_id);

for (var _x_cell = 0; _x_cell < tile_width; _x_cell++;) {
    for (var _y_cell = 0; _y_cell < tile_height; _y_cell++;) {
        bitmask_update_tile_cell(layer_id, _x_cell, _y_cell, true);
    }
}