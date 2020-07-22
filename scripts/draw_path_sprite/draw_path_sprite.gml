///@func draw_path_sprite(path,sprite,subimg)
///@desc Draws a path with a sprite (smoothly, not absolute)
///@auth Lord von Adel
///@arg path
///@arg sprite
///@arg index
var _path = argument0;
var _sprite = argument1;
var _subimg = argument2;

var sW = sprite_get_width(_sprite);
var sH = sprite_get_height(_sprite);
var _col = draw_get_color();
draw_set_color(c_white);

for (var i=0; i<path_get_length(_path)/sprite_get_height(_sprite); i++) {
	var x1, y1, x2, y2, x0, y0, dir, m;
	
	x1 = path_get_x(_path,i/(path_get_length(_path)/sprite_get_width(_sprite)));
	y1 = path_get_y(_path,i/(path_get_length(_path)/sprite_get_width(_sprite)));
	x2 = path_get_x(_path,(i+1)/(path_get_length(_path)/sprite_get_width(_sprite)));
	y2 = path_get_y(_path,(i+1)/(path_get_length(_path)/sprite_get_width(_sprite)));
	
	if(i > 0) {
		x0 = path_get_x(_path,(i-1)/(path_get_length(_path)/sprite_get_width(_sprite)));
		y0 = path_get_y(_path,(i-1)/(path_get_length(_path)/sprite_get_width(_sprite)));
	} else {
		x0 = path_get_x(_path,(i+1)/(path_get_length(_path)/sprite_get_width(_sprite)));
		y0 = path_get_y(_path,(i+1)/(path_get_length(_path)/sprite_get_width(_sprite)));
	}
	
	m = 1;
	if(i > path_get_length(_path)/sH - 1) { m = (path_get_length(_path)/sH) - floor(path_get_length(_path)/sH); }
	
	dir = point_direction(x0,y0,x1,y1);
	if(i == 0) { dir += 180; }
	draw_primitive_begin_texture(pr_trianglestrip,sprite_get_texture(_sprite,_subimg));
	draw_vertex_texture(x1+lengthdir_x(sW/2,dir+90),y1+lengthdir_y(sW/2,dir+90),0,0);
	draw_vertex_texture(x1+lengthdir_x(-sW/2,dir+90),y1+lengthdir_y(-sW/2,dir+90),1,0);
	
	dir = point_direction(x1,y1,x2,y2);
	draw_vertex_texture(x2+lengthdir_x(sW/2,dir+90),y2+lengthdir_y(sW/2,dir+90),0,m);
	draw_vertex_texture(x2+lengthdir_x(-sW/2,dir+90),y2+lengthdir_y(-sW/2,dir+90),1,m);
	draw_primitive_end();
};

draw_set_color(_col);
