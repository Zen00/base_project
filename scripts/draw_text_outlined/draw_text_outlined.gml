///@func draw_text_outlined(x,y,string,color,outline_color)
///@desc Draws an outline around your text in a sort of junky fashion (shader would do this best), also auto-converts hashes to newlines if you're used to using that
///@arg x
///@arg y
///@arg string
///@arg color
///@arg outline_color
var xx = argument0;
var yy = argument1;
var _str = argument2;

draw_set_colour(argument4);
draw_text(xx-1,yy,string_hash_to_newline(_str));
draw_text(xx+1,yy,string_hash_to_newline(_str));
draw_text(xx,yy-1,string_hash_to_newline(_str));
draw_text(xx,yy+1,string_hash_to_newline(_str));
draw_set_color(argument3);
draw_text(xx,yy,string_hash_to_newline(_str));
draw_set_color(c_white);
