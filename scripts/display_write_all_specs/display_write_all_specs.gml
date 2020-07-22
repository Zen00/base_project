///@func display_write_all_specs(x,y)
///@desc Writes all relevant display information onto whatever draw event you put this
///@arg x
///@arg y

var _str;
_str  =		"Display: "+string(display_get_width())+" x "+string(display_get_height())+" ("+string(display_get_width()/display_get_height())+")";
_str +=		"\nWindow: "+string(window_get_width())+" x "+string(window_get_height())+" ("+string(window_get_width()/window_get_height())+")";
_str +=		"\nGUI: "+string(display_get_gui_width())+" x "+string(display_get_gui_height())+" ("+string(display_get_gui_width()/display_get_gui_height())+")";
_str +=		"\nApp Surface: "+string(surface_get_width(application_surface))+" x "+string(surface_get_height(application_surface))+" ("+string(surface_get_width(application_surface)/surface_get_height(application_surface))+")";
_str +=		"\nView: "+string(camera_get_view_width(view_camera[0]))+" x "+string(camera_get_view_height(view_camera[0]))+" ("+string(camera_get_view_width(view_camera[0])/camera_get_view_height(view_camera[0]))+")";

draw_text(argument0,argument1,_str);
