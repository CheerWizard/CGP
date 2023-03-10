#version 460 core

in vec3 f_pos;

layout(location = 0) out vec4 frag_color;
layout(location = 1) out vec4 bright_color;

uniform samplerCube sampler;

void main() {
    frag_color = texture(sampler, f_pos);

    float brightness = dot(frag_color.rgb, vec3(0.2126, 0.7152, 0.0722));
    if (brightness > 1.0) {
        bright_color = vec4(frag_color.rgb, 1.0);
    } else {
        bright_color = vec4(0, 0, 0, 1);
    }
}
