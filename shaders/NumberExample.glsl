shader_type spatial;
render_mode unshaded;

#pragma glslify: DrawNumberAtPxPos = require("./modules/number_px.glsl")
#pragma glslify: localToPixel = require("./modules/local2px.glsl")

void fragment() {
	ALBEDO = vec3(.24,.8,.8) * DrawNumberAtPxPos(FRAGCOORD.xy, localToPixel(vec3(0.0),PROJECTION_MATRIX,INV_CAMERA_MATRIX,WORLD_MATRIX,VIEWPORT_SIZE), WORLD_MATRIX[3].y, 4.0, 5);
}
