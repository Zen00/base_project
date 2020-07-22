///@func pal_swap_init_system()
///@desc Initiates the palette system. Call once at the beginning of your game before use.
///@arg shader

global.PAL_SHADER =			sha_pal_swapper;
global.PAL_TEXEL_SIZE =		shader_get_uniform(sha_pal_swapper,"texel_size");
global.PAL_UV =				shader_get_uniform(sha_pal_swapper,"palette_UVs");
global.PAL_INDEX =			shader_get_uniform(sha_pal_swapper,"palette_index");
global.PAL_TEXTURE =		shader_get_sampler_index(sha_pal_swapper,"palette_texture");
