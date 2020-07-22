///@func draw_rectangle_sprite(sprite,x,y,width,height,color,alpha,outline)
///@desc Draws a rectangle from a sprite that's 1x pixel in size
///@arg sprite
///@arg x
///@arg y
///@arg width
///@arg height
///@arg color
///@arg alpha
///@arg outline
var _sprite  = argument[0];
var _x = argument[1];
var _y = argument[2];
var _width = argument[3];
var _height = argument[4];
var _color = argument[5];
var _alpha = argument[6];
var _outline = argument[7];

if(_outline) {
	draw_sprite_ext(_sprite,0,_x,_y,_width - 1,1,0,_color,_alpha);
	draw_sprite_ext(_sprite,0,_x + _width - 1,_y,1,_height - 1,0,_color,_alpha);
	draw_sprite_ext(_sprite,0,_x + 1,_y + _height - 1,_width - 1,1,0,_color,_alpha);
	draw_sprite_ext(_sprite,0,_x,_y + 1,1,_height - 1,0,_color,_alpha);
	return;
}

draw_sprite_ext(_sprite,0,_x,_y,_width,_height,0,_color,_alpha);
