///@func draw_rectangle_pixel(x1,y1,x2,y2)
///@desc Draws a rectangle (no outline, sorry) using a pixel (spr_pixel, make it if you don't have it) instead of by the built in functions, which is way faster
///@arg x1
///@arg y1
///@arg x2
///@arg y2

draw_sprite_ext(spr_pixel,0,argument0,argument1,argument2,argument3,0,c_white,1);
