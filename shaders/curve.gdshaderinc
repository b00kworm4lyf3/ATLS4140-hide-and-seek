global uniform float CURVE;

void curve_ground(inout  vec3 vertex, inout vec3 normal, mat4 view_mat, mat4 inv_view_mat) {
	vec4 view = view_mat * vec4(vertex, 1.0);
	//vec3 n = (view_mat * vec4(normal, 0.0)).xyz; //view space norm

	view.y -= CURVE * (view.x*view.x + view.z*view.z);

	//n.x += 2.0*CURVE*view.x*n.y;
	//n.z += 2.0*CURVE*view.z*n.y;
	//n = normalize(n);

	vertex = (inv_view_mat * view).xyz;
	//normal = normalize((inv_view_mat * vec4(n, 0.0)).xyz);
}