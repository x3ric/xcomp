uniform float opacity;
uniform bool invert_color;
uniform sampler2D tex;

void main() {
    vec4 c = texture2D(tex, gl_TexCoord[0].xy);

    // Adjust brightness to make it dimmer
    c.rgb *= 0.45; // You can adjust this value to control the dimness

    // Invert color if the flag is true
    if (invert_color) {
        c.rgb = vec3(1.0) - c.rgb;
    }

    // Apply opacity
    gl_FragColor = vec4(c.rgb, c.a * opacity);
}
