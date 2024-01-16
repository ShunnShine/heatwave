/// @description initialize instance variables

//this is where the beaver pathing is stored
path_to_mouse = noone;

hovered = false;

//scary
shader_color = shader_get_uniform(sh_outline_shader, "shader_color")
shader_pixel_height = shader_get_uniform(sh_outline_shader, "pixel_height");
shader_pixel_width = shader_get_uniform(sh_outline_shader, "pixel_width");

walking = false;
beaver_speed = 2;