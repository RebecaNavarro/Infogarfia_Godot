shader_type canvas_item;

uniform float amplitude = 0.1;
uniform float freq = 10.0;

void fragment () {
	// posicion del pixel
	vec2 uv = UV;
	uv.y += sin(uv.x * freq + TIME) * amplitude;
	COLOR = texture(TEXTURE, uv);
}