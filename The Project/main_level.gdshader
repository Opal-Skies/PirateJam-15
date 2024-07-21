shader_type canvas_item;

uniform vec4 color : source_color = vec4(1,1,1,1);
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void vertex() {
}

void fragment() {
	//vec4 pixel_color = texture(TEXTURE, UV);
	//float brightness = (pixel_color.r + pixel_color.g + pixel_color.b) / 3.0;
	//vec4 gray_scale = vec4(brightness,brightness,brightness,pixel_color.a);
	//COLOR = gray_scale * color;
	vec4 screen_color = texture(screen_texture, SCREEN_UV);
	COLOR = screen_color * color;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
