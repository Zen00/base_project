///@func audio_play_sound_variant(soundid,priority,loops,gain_min,gain_max,pitch_min,pitch_max)
///@desc Plays a sound like audio_play_sound_ext, but with random variations in gain and pitch. Pass a number between 0 and 1 for the min/max values of gain, and 0 and 5 for pitch. Pass noone for the vars if you don't want a change in pitch or gain.
///@arg soundid
///@arg priority
///@arg loops
///@arg gain_min
///@arg gain_max
///@arg pitch_min
///@arg pitch_max
var _soundid = argument0;
var _priority = argument1;
var _loops = argument2;
var _gmin = argument3;
var _gmax = argument4;
var _pmin = argument5;
var _pmax = argument6;

//Play the sound
var _snd = audio_play_sound(_soundid,_priority,_loops);

//Sense check
if((_gmax < _gmin) || (_pmax < _pmin)) {
	show_debug_message("Maximum value is less than minimum value, audio_play_sound_variant");
	exit;
}

//Fiddle with the gain/pitch
if(_gmin != noone) { audio_sound_gain(_snd,random_range(_gmin,_gmax),0); }
if(_pmin != noone) { audio_sound_pitch(_snd,random_range(_pmin,_pmax)); }

//Return the soundid for further processing
return _snd;
