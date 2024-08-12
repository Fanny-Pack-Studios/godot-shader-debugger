vec3 transform(mat4 transform, vec3 vec)
{
	return (vec4(vec, 1.0)*transform).xyz;
}

#pragma glslify: export(transform)
