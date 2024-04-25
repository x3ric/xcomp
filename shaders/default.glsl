uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

void main() {
    vec3 luma = vec3(.299, 0.587, 0.114);
    vec4 c = texture2D(tex, gl_TexCoord[0].xy);

    // Convert color to grayscale
    float gray = dot(c.rgb, luma);
    vec3 grayscaleColor = vec3(gray, gray, gray);

    // Invert color if the flag is true
    if (invert_color) {
        grayscaleColor = vec3(1.0) - grayscaleColor;
    }

    // Apply opacity
    gl_FragColor = vec4(grayscaleColor, c.a * opacity);
}
