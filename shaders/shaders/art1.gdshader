shader_type canvas_item;

uniform vec2 grid_size = vec2(8.0, 8.0);
uniform vec4 color1 = vec4(0.1, 0.1, 0.1, 0.1);
uniform vec4 color2 = vec4(0.9, 0.9, 0.9, 1.0);

void fragment() {
    vec2 uv = UV * grid_size;
    vec2 grid = floor(uv);

    // Alternating between color1 and color2
    float checker = mod(grid.x + grid.y, 2.0);
    COLOR = mix(color1, color2, checker);
}
