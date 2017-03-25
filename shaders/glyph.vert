
precision mediump float;

uniform vec2 resolution;
uniform float rotation; // NOTE: rotation is in radians
uniform vec2 center;
uniform vec2 mouse;

attribute vec2 position;

mat2 createRotationMatrix(float rad) {
	return mat2(cos(rad), -sin(rad), sin(rad), cos(rad));
}

vec2 toScreenCoords(vec2 v) {
	return ((v / resolution) - 0.5) * vec2(2.0, -2.0);
}

void main() {
	float len = 100.0;
	float dist = distance(position, mouse);
	float smoothDistance = (1.0 - smoothstep(0.0, len, dist)) * 5.0;

	float aspect = resolution.x / resolution.y;
	vec2 dir = normalize(position - mouse);
	vec2 normal = vec2(-dir.y, dir.x);
	normal.x /= aspect;

	mat2 rotationMatrix = createRotationMatrix(-rotation);
	vec2 transformedPosition = position + normal * smoothDistance;
	vec2 currentScreenPosition = toScreenCoords(center + rotationMatrix * (transformedPosition - center));
	gl_Position = vec4(currentScreenPosition, 0.0, 1.0);
}
