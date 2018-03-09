#version 150 core

varying vec3 normal, eyeVec;
void main()
{
  gl_Position = gl_ProjectionMatrix * gl_ModelViewMatrix * gl_Vertex;

  normal = normalize(gl_NormalMatrix * gl_Normal);

  eyeVec = -vec3(gl_ModelViewMatrix * gl_Vertex);
}
