shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    vec2 uv = (UV - vec2(0.5)) * 2.0;
    float dist = length(uv); 
    float vignette = smoothstep(0.04, 0.2, dist); // adjust softness and width
    COLOR = vec4(0.0, 0.0, 0.0, vignette * 0.85);
}


//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
