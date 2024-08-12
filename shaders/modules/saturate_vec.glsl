vec saturate_vec(vec val) {
	return clamp(val,vec(0.0),vec(1.0));
}

#pragma glslify: export(saturate_vec)
