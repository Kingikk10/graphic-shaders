//#version 430

//in vec2 UV;
//layout(location = 0)uniform mat4 proj;
//layout(location = 1)uniform mat4 view;
//layout(location = 2)uniform mat4 model;

//layout(location = 3)uniform sampler2D colorMap;
//layout(location = 4)uniform sampler2D diffuseColor;
//layout(location = 5)uniform sampler2D specularColor;
//out vec4 outColor;
//uniform sampler2D image;

//uniform bool horizontal;

//uniform float weight[5] = float[] (0.227027, 0.1945946, 0.1216216, 0.054054, 0.016216);

//void main()
//{ 
//	float time = model[0][0]; // hacky

//	vec2 tUV = UV + vec2(0,cos(UV.x+time));
//	outColor = texture(colorMap, tUV);
	
//	vec4 o[8];

//	for(int i = 0; i < 8; ++i)
//		o[i] = texture(colorMap, tUV + vec2(cos(time) * .1f * (i-4),0));

//	for(int i = 0; i < 8; ++i)
//		outColor += o[i];

//		outColor /= 9;


//		 vec2 tex_offset = 1.0 / textureSize(image, 0); // gets size of single texel
//   vec3 result = texture(image, TexCoords).rgb * weight[0]; // current fragment's contribution
//   if(horizontal)
//   {
//      for(int i = 1; i < 5; ++i)
//       {
//           result += texture(image, TexCoords + vec2(tex_offset.x * i, 0.0)).rgb * weight[i];
//            result += texture(image, TexCoords - vec2(tex_offset.x * i, 0.0)).rgb * weight[i];
//      }
//  }
//   else
//   {
//       for(int i = 1; i < 5; ++i)
//       {            result += texture(image, TexCoords + vec2(0.0, tex_offset.y * i)).rgb * weight[i];
//           result += texture(image, TexCoords - vec2(0.0, tex_offset.y * i)).rgb * weight[i];
//       }
//    }
//   FragColor = vec4(result, 1.0);
//}



#version 330 core
out vec4 FragColor;
in vec2 TexCoords;

uniform sampler2D image;

uniform bool horizontal;

uniform float weight[5] = float[] (0.227027, 0.1945946, 0.1216216, 0.054054, 0.016216);

void main()
{             
    vec2 tex_offset = 1.0 / textureSize(image, 0); // gets size of single texel
    vec3 result = texture(image, TexCoords).rgb * weight[0]; // current fragment's contribution
    if(horizontal)
    {
        for(int i = 1; i < 5; ++i)
        {
            result += texture(image, TexCoords + vec2(tex_offset.x * i, 0.0)).rgb * weight[i];
            result += texture(image, TexCoords - vec2(tex_offset.x * i, 0.0)).rgb * weight[i];
        }
    }
    else
    {
        for(int i = 1; i < 5; ++i)
        {
            result += texture(image, TexCoords + vec2(0.0, tex_offset.y * i)).rgb * weight[i];
            result += texture(image, TexCoords - vec2(0.0, tex_offset.y * i)).rgb * weight[i];
        }
    }
    FragColor = vec4(result, 1.0);
}