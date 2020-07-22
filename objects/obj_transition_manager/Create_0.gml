///@description 

enum TRANS_MODE {
	off,
	next,
	goto,
	restart,
	room_reset,
	intro,
	quit
}

enum TRANSITION_TYPE {
	none,
	slide,
	fade
}

g_width_ =			display_get_gui_width();
g_height_ =			display_get_gui_height();
gw_half_ =			g_width_ * 0.5;
gh_half_ =			g_height_ * 0.5;
mode_ =				TRANS_MODE.off;
type_ =				TRANSITION_TYPE.fade;
alpha_target_ =		1.2;
alpha_ =			0;
spd_ =				0.005;
target_ =			room;
