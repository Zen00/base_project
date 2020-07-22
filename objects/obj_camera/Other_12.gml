///@description Free State

//Clamp the view to the room
var _x = clamp(x,0,room_width - view_width_);
var _y = clamp(y,0,room_height - view_height_);

x = _x;
y = _y;
camera_set_view_pos(CAM,_x,_y);
