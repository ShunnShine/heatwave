/// @description Initialize path variable

path_to_mouse = noone;

hovered = false;

shader_pixel_height = shader_get_uniform(sh_outline_shader, "pixel_height");
shader_pixel_width = shader_get_uniform(sh_outline_shader, "pixel_width");