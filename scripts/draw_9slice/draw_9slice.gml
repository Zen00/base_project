///@func draw_9slice_button(sprite,x,y,width,height);
///@desc Draws the button with text at the desired location, using the provided 9slice
///@arg sprite
///@arg x
///@arg y
///@arg width
///@arg height
var _spr =		argument0;
var _x =		argument1;
var _y =		argument2;
var _w =		argument3;
var _h =		argument4;

//Vars
var _cell_size = sprite_get_width(_spr) / 3;
var _middle_w = _w - (_cell_size*2);
var _middle_h = _h - (_cell_size*2);

#region Center
for(var h=0; h<_middle_h; h+=_cell_size) {
	for(var w=0; w<_middle_w; w+=_cell_size) {
		var _cx = _x + _cell_size + w;
		var _cy = _y + _cell_size + h;
		
		draw_sprite_part(_spr,image_index,_cell_size,_cell_size,_cell_size,_cell_size,_cx,_cy);
	}
}
#endregion

#region Edges
//Top
for(var i=0; i<_middle_w; i+=_cell_size) {
	var _cx = _x + _cell_size + i;
	
	draw_sprite_part(_spr,image_index,_cell_size,0,_cell_size,_cell_size,_cx,_y);
}

//Bottom
for(var i=0; i<_middle_w; i+=_cell_size){
    var _cx = _x + _cell_size + i;
            
    draw_sprite_part(_spr, image_index, _cell_size, _cell_size*2, _cell_size, _cell_size, _cx, (_y + _h) - _cell_size);
}

//Left
for(var i=0; i<_middle_h; i+=_cell_size){
    var _cy = _y + _cell_size + i;
            
    draw_sprite_part(_spr, image_index, 0, _cell_size, _cell_size, _cell_size, _x, _cy);
}

//Right
for(var i=0; i<_middle_h; i+=_cell_size){
    var _cy = _y + _cell_size + i;
            
    draw_sprite_part(_spr, image_index, _cell_size*2, _cell_size, _cell_size, _cell_size, (_x + _w) - _cell_size, _cy);
}
#endregion

#region Corners
//Top left
draw_sprite_part(_spr, image_index, 0, 0, _cell_size, _cell_size, _x, _y);
    
//Top Right
draw_sprite_part(_spr, image_index, _cell_size*2, 0, _cell_size, _cell_size, (_x + _w) - _cell_size, _y);
    
//Bottom left
draw_sprite_part(_spr, image_index, 0, _cell_size*2, _cell_size, _cell_size, _x, (_y + _h) - _cell_size);
    
//Bottom Right
draw_sprite_part(_spr, image_index, _cell_size*2, _cell_size*2, _cell_size, _cell_size, (_x + _w) - _cell_size, (_y + _h) - _cell_size);
#endregion
