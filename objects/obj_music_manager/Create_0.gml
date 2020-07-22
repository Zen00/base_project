///@description 

//Properties
now_playing_ = noone;
previous_track_ = noone;

//Load the audio groups
alarm[0] = 1; //If you don't do it on the next frame, it won't load (on game restart)

//Set the starting music volume, can read from an external ini
if(file_exists("settings.ini")) {
	
} else {
	mus_vol_ = global.MUS_VOLUME;
	sfx_vol_ = global.SFX_VOLUME;
	audio_group_set_gain(MUS,mus_vol_,0);
	audio_group_set_gain(SFX,sfx_vol_,0);
}
