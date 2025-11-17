#version 330

layout(location=0) out vec4 FragColor;

in
vec2 v_UV;
uniform float u_Time;

const float c_PI = 3.141562;

void main()
{
    vec4 newColor = vec4(0);
    float xValue = pow(abs(sin(v_UV.x * 2 * c_PI * 4)), 0.5);
    xValue += pow(abs(sin(v_UV.y * 2 * c_PI * 4)), 0.5);
    newColor = vec4(xValue);
    FragColor = newColor;
}