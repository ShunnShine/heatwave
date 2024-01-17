//arguably the most important variable in the game
global.pause = false;

//change this if using more than 1 camera
global.camera = view_camera[0];
global.camera_move_object = instance_find(obj_camera_free_movement, 0);
room_set_camera(room, 0, global.camera);

global.selected_beaver = noone;
global.targeted_object = noone;

//selection color
global.hover_color = [1, 1, 0, 1];
global.selected_color = [0, 1, 0, 1];

//don't touch these
global.tile_width = 8;
global.tile_height = 8;
global.num_tiles_x = (room_width/global.tile_width);
global.num_tiles_y = (room_height/global.tile_height);

//draw the movement grid
grid = mp_grid_create(0, 0, global.num_tiles_x, global.num_tiles_y, global.tile_width, global.tile_height);

//  ADD OBSTACLES HERE
mp_grid_add_instances(grid, obj_log, false);