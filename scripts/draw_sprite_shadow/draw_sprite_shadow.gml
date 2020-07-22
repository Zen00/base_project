///@func draw_sprite_shadow(dir,len,scale,color,alpha);
///@desc Draw a duplicate of the sprite as a shadow
///@arg direction
///@arg distance
///@arg scale
///@arg color
///@arg alpha
var _dir = argument0;
var _len = argument1;
var _sca = argument2;
var _col = argument3;
var _alp = argument4;

var xx = x + lengthdir_x(_len,_dir);
var yy = y + lengthdir_y(_len,_dir);
gpu_set_fog(true,_col,0,1);
draw_sprite_ext(sprite_index,image_index,xx,yy,_sca,_sca,image_angle,c_white,_alp);
gpu_set_fog(0,0,0,0);
