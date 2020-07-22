//Run me at the start of the game, to declare these things
gml_pragma("global","MACROS()");

//Enums, defined before globals so globals can use the enums
enum DIR2 {
	right = 1,
	left = -1
}

enum DIR4 {
	right,
	up,
	left,
	down
}

enum DIR8 {
	right,
	right_up,
	up,
	left_up,
	left,
	left_down,
	down,
	right_down
}

enum TILE_TYPE {
	none,
	solid,
	platform,
	ladder
}

//Randomize
randomize();

//Font
var _glyphs_map =			" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
var _oldschool_map =		" !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
var _lil_d0t_map =			"ABDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz01234567890~`!@#$%^&*()-_+=[]{}|\\:;\"'.,<>/?";
var _boxy_bold_map =		"!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`{|}~";
var _good_neighbor_map =	"!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
global.FONT = font_add_sprite_ext(spr_font_good_neighbor,_oldschool_map,true,1);
draw_set_font(global.FONT);

//Various globals
global.MUS_VOLUME = 0.25;
global.SFX_VOLUME = 0.25;
global.DEBUG = false;
global.PAUSE = false;

//Macros
#macro SEC game_get_speed(gamespeed_fps)
#macro TILE_WIDTH 16
#macro TILE_HEIGHT 16
#macro TILE_SIZE 16
#macro TILE_POW 4

//Scripts
pal_swap_init();
