shader_type canvas_item;

void fragment() {
	// color del pixel en cada posicion
	vec4 color = texture(TEXTURE, UV);
	color.r = 1.0;
	COLOR = color;
}