///@func queue_new_song(fade_length)
///@desc Similar to queue_new_song, but hard coded to only give silence
///@arg fade_length
var _fl = undefined;

//Define the fade length
_fl = argument_count == 1 ? argument[0] : 0;

//Use the music manager for variable wrapping
with(obj_music_manager) { audio_sound_gain(now_playing_,0,_fl); }
