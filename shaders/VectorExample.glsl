shader_type spatial;
render_mode unshaded;

#pragma glslify: DrawVec3AtPxPos = require("./modules/vec3_px.glsl")
#pragma glslify: localToPixel = require("./modules/local2px.glsl")

void fragment() {
	ALBEDO = 
		DrawVec3AtPxPos(FRAGCOORD.xy, localToPixel(vec3(1.0,0.0,0.0),PROJECTION_MATRIX,INV_CAMERA_MATRIX,WORLD_MATRIX,VIEWPORT_SIZE), NORMAL, 2.0, 2) +
		DrawVec3AtPxPos(FRAGCOORD.xy, localToPixel(vec3(0.0,1.0,0.0),PROJECTION_MATRIX,INV_CAMERA_MATRIX,WORLD_MATRIX,VIEWPORT_SIZE), NORMAL, 2.0, 2) +
		DrawVec3AtPxPos(FRAGCOORD.xy, localToPixel(vec3(0.0,0.0,1.0),PROJECTION_MATRIX,INV_CAMERA_MATRIX,WORLD_MATRIX,VIEWPORT_SIZE), NORMAL, 2.0, 2);
}
