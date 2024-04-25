uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

void main() {
	vec3 luma = vec3(.299, 0.587, 0.114);
	vec4 c = texture2D(tex, gl_TexCoord[0].xy);
	gl_FragColor = vec4(vec3(dot(c.rgb, luma)), c.a);;
}
