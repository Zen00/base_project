///@description 

//State execution
event_user(state_);

//Shake
var _cam_w = camera_get_view_width(CAM);
var _cam_h = camera_get_view_height(CAM);
if(shake_) {
	//Zoom in the view a bit, so you have room to shake if we're in a view size room
	//Also keeps it centered while zooming in
	var xx = view_width_ * 0.95;
	var yy = view_height_ * 0.95;
	xx = lerp(_cam_w,xx,0.5);
	yy = lerp(_cam_h,yy,0.5);
	var _xdiff = view_width_ - xx;
	var _ydiff = view_height_ - yy;
	camera_set_view_size(CAM,xx,yy);
	camera_set_view_pos(CAM,clamp(x + _xdiff + random_range(-shake_intensity_,shake_intensity_),0,room_width-_cam_w),clamp(y + _ydiff + random_range(-shake_intensity_,shake_intensity_),0,room_height-_cam_h));

//Once the shake is over, return the camera to its original size (which should also return it to its original position)
} else if((_cam_w != view_width_) || (_cam_h != view_height_)) {
	var xx = lerp_smooth(_cam_w,view_width_,0.5,0.001);
	var yy = lerp_smooth(_cam_h,view_height_,0.5,0.001);
	var _xdiff = view_width_ - xx; //How far am I from my "normal" position
	var _ydiff = view_height_ - yy;
	camera_set_view_size(CAM,xx,yy);
	camera_set_view_pos(CAM,x + _xdiff,y + _ydiff);
}
