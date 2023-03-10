#version 460 core

layout (location = 0) in vec3 v_pos;
layout (location = 1) in vec2 v_uv;
layout (location = 2) in vec3 v_normal;

out vec3 f_pos;
out vec2 f_uv;
out vec3 f_normal;

layout (std140, binding = 0) uniform Camera {
    mat4 perspective;
    mat4 view;
};

uniform mat4 model;

uniform float outline_thickness;

void main()
{
    vec4 world_pos = model * vec4(v_pos + v_normal * outline_thickness, 1.0);
    vec4 world_normal = transpose(inverse(model)) * vec4(v_normal, 0);

    f_pos = world_pos.xyz;
    f_normal = world_normal.xyz;
    f_uv = v_uv;

    gl_Position = perspective * view * world_pos;
}