shader_type spatial;
render_mode unshaded;

#pragma glslify: DrawMat4AtPxPos = require("./modules/mat4_px.glsl")
#pragma glslify: worldToPixel = require("./modules/world2px.glsl")

void fragment() {
	ALBEDO = vec3(
			DrawMat4AtPxPos(
				FRAGCOORD.xy, 
				worldToPixel(WORLD_MATRIX[3].xyz,PROJECTION_MATRIX,INV_CAMERA_MATRIX,VIEWPORT_SIZE),
				WORLD_MATRIX,
				1.0,
				3
			)
		);
}
