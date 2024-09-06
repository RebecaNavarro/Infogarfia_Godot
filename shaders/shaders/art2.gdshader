shader_type canvas_item;

uniform float spiral_tightness = 2.0;
uniform float spiral_rotations = 5.0;

void fragment() {
    vec2 uv = UV - vec2(0.5);
    float angle = atan(uv.y, uv.x);
    float dist = length(uv);

    // Logarithmic spiral equation
    float spiral = mod(angle + log(dist * spiral_tightness + 1.0) * spiral_rotations, TAU);
    float intensity = smoothstep(0.0, 0.1, abs(sin(spiral)));

    // Applying color based on the intensity of the spiral
    COLOR = vec4(vec3(intensity), 0.5);
}