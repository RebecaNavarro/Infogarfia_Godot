shader_type canvas_item;

uniform float pixel_size = 0.05;

void fragment() {
	vec2 uv = floor(UV / pixel_size) * pixel_size;
	COLOR = texture(TEXTURE, uv);
}