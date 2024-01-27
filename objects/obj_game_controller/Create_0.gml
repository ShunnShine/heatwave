//arguably the most important variable in the game

//change this if using more than 1 camera
global.camera = view_camera[0];
global.camera_move_object = instance_find(obj_camera_free_movement, 0);
room_set_camera(room, 0, global.camera);

global.camera_zoom_speed = 15;
global.camera_width = camera_get_view_width(global.camera);
global.camera_height = camera_get_view_height(global.camera);

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

global.timer = 0;
global.wave = 0;
global.target_water = 0;
global.current_water = 0;

//draw the movement grid
grid = mp_grid_create(0, 0, global.num_tiles_x, global.num_tiles_y, global.tile_width, global.tile_height);

//  ADD OBSTACLES HERE
mp_grid_add_instances(grid, obj_log, false);