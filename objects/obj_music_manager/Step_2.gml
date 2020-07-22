///@description 

//Kill the audio once it's faded out enough (left fuzzy in case something prevents it from reaching 0, looking at you HTML)
if(audio_is_playing(previous_track_) && (audio_sound_get_gain(previous_track_) <= 0.001)) {	audio_stop_sound(previous_track_); }
