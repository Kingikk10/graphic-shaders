//#version 430

////layout(location = 0) in vec4 position;
//layout(location = 3) in vec2 texcoord;

//layout (location = 0) out vec4 FragColor;
//layout (location = 1) out vec4 BrightColor;


//out vec2 UV;

//void main()
//{	
//	UV =	texcoord;
//	gl_Position = position;
//	 [...] // first do normal lighting calculations and output results
//  FragColor = vec4(lighting, 1.0f);
//   // Check whether fragment output is higher than threshold, if so output as brightness color
//   float brightness = dot(FragColor.rgb, vec3(0.2126, 0.7152, 0.0722));
//   if(brightness > 1.0)
//        BrightColor = vec4(FragColor.rgb, 1.0);
//}
#version 330 core
layout (location = 0) out vec4 FragColor;
layout (location = 1) out vec4 BrightColor;

[...]

void main()
{            
    [...] // first do normal lighting calculations and output results
    FragColor = vec4(lighting, 1.0f);
    // Check whether fragment output is higher than threshold, if so output as brightness color
    float brightness = dot(FragColor.rgb, vec3(0.2126, 0.7152, 0.0722));
    if(brightness > 1.0)
        BrightColor = vec4(FragColor.rgb, 1.0);
}