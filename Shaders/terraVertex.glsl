#version 330 core

in vec4 position;
uniform sampler2D terrain;

void main(void){
  vec2 texCoord = position.xy;
  float height = texture(terrain, texCoord).a;
  vec4 displaced = vec4(
  position.x, position.y,
  height, 1.0);
  gl_position = displaced;
}
