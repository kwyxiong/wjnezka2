#ifdef GL_ES
precision mediump float;
#endif

varying vec4 v_fragmentColor;
varying vec2 v_texCoord;
uniform float light;

vec4 blur(vec2);

void main(void)
{
	vec4 col = texture2D(CC_Texture0, v_texCoord);
	gl_FragColor = vec4(col.a *light ,col.a *light,col.a *light,col.a);
}


