//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform float pixel_height;
uniform float pixel_width;
uniform vec4 shader_color;

void main()
{
	vec4 texture_color = texture2D( gm_BaseTexture, v_vTexcoord );
	vec2 offsetx;
	vec2 offsety;
	offsetx.x = pixel_width;
	offsety.y = pixel_height;

	if (texture_color.a == 0.0 &&
			(
			texture2D( gm_BaseTexture, v_vTexcoord + offsetx ).a > 0. ||
			texture2D( gm_BaseTexture, v_vTexcoord - offsetx ).a > 0. ||
			texture2D( gm_BaseTexture, v_vTexcoord + offsety ).a > 0. ||
			texture2D( gm_BaseTexture, v_vTexcoord - offsety ).a > 0.
			)
		) {
		gl_FragColor = v_vColour * shader_color;
	}
	else {
		gl_FragColor = v_vColour * texture_color;
	}
}
