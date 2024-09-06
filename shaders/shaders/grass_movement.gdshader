shader_type canvas_item;

void vertex() {

	float angle = VERTEX.y * TIME * 0.001;
	mat2 rotation = mat2(
		vec2(cos(angle), -sin(angle)),
		vec2(sin(angle), cos(angle))
		);
	if (VERTEX.y < 0.0) {
		VERTEX = rotation * VERTEX;
	}
}