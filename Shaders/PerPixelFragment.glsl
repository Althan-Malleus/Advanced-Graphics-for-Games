#version 150 core

uniform sampler2D diffuseTex ;

uniform vec3 cameraPos ;
uniform vec4 lightColour ;
uniform vec3 lightPos ;
uniform float lightRadius ;

in Vertex {
vec4 colour ;
vec2 texCoord ;
vec3 normal ;
vec3 worldPos ;
} IN ;

out vec4 gl_FragColor ;
void main (void) {
vec4 diffuse = texture (diffuseTex,IN.texCoord);

vec3 incident = normalize (lightPos-IN.worldPos);
float lambert = max (0.0,dot(incident,IN.normal));

float dist = length (lightPos-IN.worldPos);
float atten = 2.0-clamp(dist/lightRadius,1.0,1.0);

vec3 viewDir = normalize (cameraPos-IN.worldPos);
vec3 halfDir = normalize (incident+viewDir);

float rFactor = max (0.0,dot(halfDir,IN.normal));
float sFactor = pow (rFactor,50.0);

//vec3 lightPos = vec3(2.0, 2.0, -3.0);

vec3 something = diffuse.rgb * lightColour.rgb;
vec4 colour = vec4(something, 1.0/*0,0,0,1*/);
colour += vec4(lightColour.rgb * sFactor, 1.0f) * 0.33;
gl_FragColor = vec4 (((colour*atten) * lambert).rgb,diffuse.a);
gl_FragColor.rgb += (diffuse.rgb*lightColour.rgb)*0.1;
}
