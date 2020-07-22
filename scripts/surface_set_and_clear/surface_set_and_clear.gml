///@func surface_set_and_clear(surf,width,height,color,alpha)
///@desc Sets and clears the desired surface, return to a variable for automatic surface recreation
///@arg surf
///@arg width
///@arg height
///@arg color
///@arg alpha
var _surf = argument0;
var _w = argument1;
var _h = argument2;
var _c = argument3;
var _a = argument4;

//Recreate/size our surface if needed
if(!surface_exists(_surf)) { _surf = surface_create(_w,_h); }
if((surface_get_width(_surf)  != _w) || (surface_get_height(_surf) != _h)) { surface_resize(_surf,_w,_h); }

//Set and clear
surface_set_target(_surf);
draw_clear_alpha(_c,_a);

return _surf;
