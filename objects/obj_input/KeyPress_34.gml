///@description DEBUG Slow motion

if(global.DEBUG) {
	if(game_get_speed(gamespeed_fps) == 1) { game_set_speed(6,gamespeed_fps); } else { game_set_speed(60,gamespeed_fps); }
}