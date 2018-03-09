#version 330 core


in vec4 Position;
in vec3 Normal;

uniform mat4 projMatrix;
uniform mat4 modelMatrix;
uniform mat3 normalMatrix;
uniform vec3 DiffuseMaterial;

out vec3 EyespaceNormal;
out vec3 Diffuse;

void main(void)
{
    EyespaceNormal = NormalMatrix * Normal;
    gl_Position = projMatrix * modelMatrix * Position;
    Diffuse = DiffuseMaterial;
}
