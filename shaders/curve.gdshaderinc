global uniform float CURVE;

void curve_ground(inout  vec3 vertex, mat4 view_mat, mat4 inv_view_mat) {
	vec4 view = view_mat * vec4(vertex, 1.0);
	float dist = length(view.xz);
	view.y -= CURVE * (dist*dist);
	vertex = (inv_view_mat * view).xyz;
}