//draw the movement grid
grid = mp_grid_create(0, 0, room_width / 8, room_height / 8, 8, 8);

//add obstacles
mp_grid_add_instances(grid, obj_log, false);


