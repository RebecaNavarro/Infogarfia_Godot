shader_type canvas_item;

uniform float pulse_speed = 1.0;
uniform float init_offset = 0.5;

void fragment() {
	vec2 uv = UV - vec2(init_offset);
	float dist = length(uv) * 2.0;
	dist = dist + sin(TIME * pulse_speed) * 0.2;
	COLOR = texture(TEXTURE, UV + uv * dist);
}