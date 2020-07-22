///@func draw_text_shadow(x,y,string,color,shadow_color,shadow_alpha)
///@desc Puts a drop shadow under your text
///@arg x
///@arg y
///@arg string
///@arg color
///@arg shadow_color
///@arg shadow_alpha
var xx = argument0;
var yy = argument1;
var _str = argument2;

//Draw shadow
draw_set_colour(argument4);
draw_set_alpha(argument5);
draw_text(xx,yy+1,string_hash_to_newline(_str));

//Draw Text
draw_set_colour(argument3);
draw_set_alpha(1);
draw_text(xx,yy,string_hash_to_newline(_str));
draw_set_colour(c_white);
