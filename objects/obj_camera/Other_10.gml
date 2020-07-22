///@description Targeted State

//Simple camera follows the player
if(instance_exists(target_)) {
	//Calculate a position that is centered on the player
	var _x = target_.x - view_width_ / 2;
	if(instance_exists(obj_room_boundary)) {
		var _id = collision_point(x,y,obj_room_boundary,false,true);//collision_rectangle(x,y,x+4,y+4,obj_room_boundaries,false,false);
		var _y = _id.y;//target_.y - view_height_ / 2;
		_x = clamp(_x,_id.bbox_left,_id.bbox_right + 1 - view_width_);
	} else {
		var _y = target_.y - view_height_ / 2;
	}
	
	//Clamp the view to the room
	_x = clamp(_x,0,room_width - view_width_);
	_y = clamp(_y,0,room_height - view_height_);
	
	//Position the camera
	x = _x;
	y = _y;
	camera_set_view_pos(CAM,_x,_y);
}
