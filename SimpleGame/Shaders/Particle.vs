#version 330

in vec3 a_Position;
in float a_Radius;
in vec4 a_Color;
in float a_STime;
in vec3 a_Velocity;
in float a_Lifetime;
in float a_Mass;

out vec4 v_Color;

uniform float u_Time;
uniform vec3 u_Force;
const float c_PI = 3.141592;
const vec2 c_G = vec2(0.0, -9.8); // 0923

void main()
{
   float lifetime = a_Lifetime;
   float newAlpha = 1.0;
   float newTime = u_Time - a_STime;
   vec4 newPosition = vec4(a_Position, 1);

   if(newTime > 0){
      float t = fract(newTime /lifetime) * lifetime;   // t : 0 ~ lifetime
      float forceX = u_Force.x * 10 + c_G.x * a_Mass;
      float forceY = u_Force.x + c_G.y * a_Mass;

      float aX = forceX / a_Mass;
      float ay = forceY / a_Mass;

      float tt = t * t;
      float x = a_Velocity.x * t + 0.5 * aX * tt;            
      float y = a_Velocity.y * t + 0.5 * ay * tt; 

      newPosition.xy += vec2(x, y);   
      newAlpha = 1 - t/lifetime;    // 1~0
   }
   else
   {
      newPosition.xy = vec2(-100000, 0);   
   }

   gl_Position = newPosition;
   v_Color = vec4(a_Color.rgb, newAlpha);
}
