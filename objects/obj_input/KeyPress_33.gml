///@description DEBUG Slow motion

if(global.DEBUG) {
	if(game_get_speed(gamespeed_fps) == 60) { game_set_speed(6,gamespeed_fps); } else { game_set_speed(1,gamespeed_fps); }
}
