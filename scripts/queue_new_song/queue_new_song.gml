///@func queue_new_song(song,priority,loop,[fade_length])
///@desc Kill the current song and start a new one (or noone if you want silence)
///@arg song
///@arg priority
///@arg loop
///@arg [fade_length]
var _song = argument[0];
var _priority = argument[1];
var _loop = argument[2];
var _fl = undefined;

//Define the fade length
_fl = argument_count == 4 ? argument[3] : 0;

//Use the music manager for variable wrapping
with(obj_music_manager) {
	if(_song == noone) {
		audio_sound_gain(now_playing_,0,_fl);
	}
	else if(!audio_is_playing(_song)) {
		previous_track_ = now_playing_;
		now_playing_ = audio_play_sound(_song,_priority,_loop);
		audio_sound_gain(now_playing_,0,0); //Crossfade implementation
		audio_sound_gain(now_playing_,mus_vol_,_fl);
		audio_sound_gain(previous_track_,0,_fl);
	}
	
	return now_playing_;
}
