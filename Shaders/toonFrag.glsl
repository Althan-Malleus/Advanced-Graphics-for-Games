#version 330 core


in vec3 EyespaceNormal;

in vec3 Diffuse;

out vec4 FragColor;



uniform vec3 lightPos;

uniform vec3 AmbientMaterial;

uniform vec3 SpecularMaterial;

uniform float Shininess;


void main(void)
{

   vec3 N = normalize(EyespaceNormal);
    vec3 L = normalize(lightPos);
   vec3 E = vec3(0, 0, 1);
    vec3 H = normalize(L + E);
   float df = max(0.0, dot(N, L));

    float sf = max(0.0, dot(N, H));
   sf = pow(sf, Shininess);
vec3 color = AmbientMaterial + df * diffuseTex + sf * SpecularMaterial;
FragColor = vec4(color, 1.0);
}
