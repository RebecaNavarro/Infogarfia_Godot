shader_type canvas_item;
uniform float blue_freq = 0.5;

void fragment() {
	// color del pixel en cada posicion
	vec4 color = texture(TEXTURE, UV);
	color.rgb = vec3(sin(TIME), cos(TIME), sin(TIME * blue_freq));
	COLOR = color;
}