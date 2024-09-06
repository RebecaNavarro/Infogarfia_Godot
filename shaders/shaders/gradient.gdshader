shader_type canvas_item;

uniform float min_rad = 0.1;
uniform float max_rad = 0.4;

void fragment() {
	vec2 uv = UV - vec2(0.5);
	float dist = length(uv);

	float gradient = smoothstep(min_rad, max_rad, dist);
	COLOR = texture(TEXTURE, UV) * vec4(1.0, 1.0, 1.0, 1.0 - gradient);
}
