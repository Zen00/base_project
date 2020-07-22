/// @func pal_swap_set(palette_sprite_index,palette_index);
/// @desc Take the given palette (first column in the palette), and swap the given sprite's colors with the given palette column
/// @arg palette_sprite_index
/// @arg palette_index
var _pal_sprite=argument[0];
var _pal_index=argument[1];

shader_set(global.PAL_SHADER);

//Get information about the palette
var _tex = sprite_get_texture(_pal_sprite,0);
var _UVs = sprite_get_uvs(_pal_sprite,0);
texture_set_stage(global.PAL_TEXTURE,_tex);
gpu_set_texfilter_ext(global.PAL_TEXTURE,true);
var _texel_x = texture_get_texel_width(_tex);
var _texel_y = texture_get_texel_height(_tex);
var _texel_hx = _texel_x * 0.5;
var _texel_hy = _texel_y * 0.5;

//Finalize the shader by telling it what palette to use
shader_set_uniform_f(global.PAL_TEXEL_SIZE,_texel_x,_texel_y);
shader_set_uniform_f(global.PAL_UV,_UVs[0] + _texel_hx,_UVs[1] + _texel_hy,_UVs[2] + _texel_hx,_UVs[3] + _texel_hy);
shader_set_uniform_f(global.PAL_INDEX,_pal_index);
