  
shader_type canvas_item;


uniform vec2 tile_factor = vec2(10, 10);
uniform float aspect_ratio = 0.5;

void fragment() {
	
	vec2 tiled_uvs = UV * tile_factor; // Scale the UVs to get a tiled texture
	tiled_uvs.y *= aspect_ratio; // Apply aspect ratio
	
	vec2 waves_uv_offset;
	waves_uv_offset.y = sin((TIME*5.0) + (tiled_uvs.x*5.0) + (tiled_uvs.y*0.5)) * 0.1;
	waves_uv_offset.x = sin(TIME + tiled_uvs.y + tiled_uvs.x) * 0.0;
	
	COLOR = texture(TEXTURE, tiled_uvs + waves_uv_offset); // And lookup our color

}