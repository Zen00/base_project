///@description 

//If they're loaded then we can start the game (because if we try to go to the title screen before the music loads, no music will play)
//Only applicable if we have an init room
show_debug_message("Async load event: " + async_load[? "type"]);
show_debug_message("Audio group #: " + string(async_load[? "group_id"]));
switch(async_load[? "type"]) {
	case "audiogroup_load":
		if(audio_group_is_loaded(MUS) && audio_group_is_loaded(SFX))
			room_goto(rm_patreon_supporters);
	break;
}
