///@description 

enum CAM_MODE {
	targeted,
	fixed,
	free
}
state_ = CAM_MODE.fixed;
transition_direction_ = DIR4.right;

//Our goal: Resize the game to the maximum pixel perfect size allowable by default that fits your screen
//(minus 1 zoom level, because typically being maximum sized is undesirable as it makes it hard to drag the window around)
//Also zooms to fit full screen when full screen mode is activated, this is not a pixel perfect zoom

//Properties
view_width_ = 256; //These numbers are the size of the view that an NES displays
view_height_ = 240;
display_width_ = display_get_width(); //Gets your monitors aspect ratio
display_height_ = display_get_height();
zoom_ = max(floor(display_height_ / view_height_) - 1,1); //The # is arbitrary, we're using h/w because the aspect ratio of the ideal w/h is greater than 1
#macro CAM view_camera[0]

//Set the display properties
window_set_size(view_width_*zoom_,view_height_*zoom_);
display_set_gui_size(view_width_,view_height_);
surface_resize(application_surface,view_width_*zoom_,view_height_*zoom_); //Resizing the app surface gives more sub-pixels to work with, for smoother rotation and other non-pixel perfect animations

//Center the window
alarm[0] = 1;

//Targeting
x_previous_ = x;
y_previous_ = y;
target_ = noone;

//Camera shake
shake_ = false;
shake_intensity_ = 6;


//So apprently the reason for the overscan of 8 pixels on the top of the screen and 8 pixels on the bottom of the screen
//is because many NES games were built at 256/240, but due to the nature of 4:3 CRT monitors they were expected to
//stretch to fit, so the extra 8 pixels allowed the games to stretch from their native resolution to fit 4:3 without
//creating any black bars on the top/bottom of the screen.
