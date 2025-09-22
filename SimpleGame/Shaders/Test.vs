#version 330

in vec3 a_Position;
in vec4 a_Color;

out vec4 v_Color;
uniform float u_Time;

const float pi = 3.141592;

void main()
{
	// x  좌표 이동
	float value = fract(u_Time) * 2 - 1;	// -1 ~ 1

	//  원 운동
	float rad = (value + 1) * pi;	// 0 ~ 2PI
	float x = cos(rad);
	float y = sin(rad);

	vec4 newPosition = vec4(a_Position,1);
	newPosition.xy = newPosition.xy
	+ (value + 1) * 0.5 * vec2(x , y);
	gl_Position = newPosition;
	
	v_Color = a_Color;
}
