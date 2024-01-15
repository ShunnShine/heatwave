/// @description Outline Beaver

var _pixel_height = texture_get_texel_height(sprite_get_texture(sprite_index, image_index));
var _pixel_width = texture_get_texel_width(sprite_get_texture(sprite_index, image_index));

if hovered {
	shader_set(sh_outline_shader);
	shader_set_uniform_f(shader_pixel_height, _pixel_height);
	shader_set_uniform_f(shader_pixel_width, _pixel_width);
	draw_self();
	shader_reset();
}
else {
	draw_self();
}
