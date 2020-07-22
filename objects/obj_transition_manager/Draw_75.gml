///@description 

if(mode_ == TRANS_MODE.off) { exit; }

if(type_ == TRANSITION_TYPE.slide) {
	draw_set_color(c_black);
	draw_rectangle_pixel(0,0,g_width_,alpha_ * gh_half_);
	draw_rectangle_pixel(0,g_height_,g_width_,g_height_ - (alpha_ * gh_half_));
	draw_set_color(c_white);
}

if(type_ == TRANSITION_TYPE.fade) {
	draw_set_alpha(alpha_);
	draw_set_color(c_black);
	draw_rectangle_pixel(0,0,g_width_,g_height_);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
