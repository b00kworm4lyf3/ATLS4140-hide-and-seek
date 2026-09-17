shader_type spatial;
render_mode world_vertex_coords;

#include "res://shaders/curve.gdshaderinc"

uniform sampler2D BASE_TEX;
uniform vec4 color = vec4(0.1, 0.7, 0.5, 1.0);

void vertex() {
	curve_ground(VERTEX, NORMAL, VIEW_MATRIX, INV_VIEW_MATRIX);
}

void fragment() {
	vec4 tex = texture(BASE_TEX, UV);
	
	ALBEDO = tex.rgb * color.rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
