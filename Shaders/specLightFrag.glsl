#version 150 core

varying vec3 normal, eyeVec;

vec4 light0 ()
{
  vec4 color;

  vec3 lightDir = normalize(vec3(gl_LightSource[0].position));

  vec3 eyeVecNormal = normalize(eyeVec);

  vec3 reflectVec = normalize(-reflect(lightDir, normal));

  vec4 ambient = gl_LightSource[0].ambient * gl_FrontMaterial.ambient;

  vec4 diffuse = gl_LightSource[0].diffuse * max(dot(normal,lightDir),0.0) * gl_FrontMaterial.diffuse;

  vec4 specular = gl_FrontMaterial.specular * pow(max(dot(reflectVec, eyeVecNormal), 0.0), gl_FrontMaterial.shininess);

  color = ambient + diffuse + specular;

  return color;
}

void main()
{
  gl_FragColor = light0;
}
