float saturate(float val) {
	return clamp(val,0.0,1.0);
}

#pragma glslify: export(saturate)
