
precision mediump float;

uniform vec2 resolution;

vec2 toFragCoords(vec2 v) {
	return vec2(v.x, resolution.y - v.y);
}

void main() {
    gl_FragColor = vec4(vec3(0.0), 1.0);
}
