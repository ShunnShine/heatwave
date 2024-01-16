function draw_outline(_object, _selection){
	
	shader_color = shader_get_uniform(sh_outline_shader, "shader_color")
	shader_pixel_height = shader_get_uniform(sh_outline_shader, "pixel_height");
	shader_pixel_width = shader_get_uniform(sh_outline_shader, "pixel_width");
	
	pixel_width = texture_get_texel_width(sprite_get_texture(_object.sprite_index, _object.image_index));
	pixel_height = texture_get_texel_height(sprite_get_texture(_object.sprite_index, _object.image_index));
	
	shader_set(sh_outline_shader);
	shader_set_uniform_f(shader_color, _selection[0], _selection[1], _selection[2], _selection[3]);
	shader_set_uniform_f(shader_pixel_height, pixel_height);
	shader_set_uniform_f(shader_pixel_width, pixel_width);
	draw_self();
	shader_reset();
}