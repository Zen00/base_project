///@func fade_transition(mode,[target_room])
///@desc Create a fade transition to a new room
///@arg mode
///@arg [target_room]

with(obj_transition_manager) {
	mode_ = argument[0];
	type_ = TRANSITION_TYPE.fade;
	if(argument_count > 1) { target_ = argument[1]; }
}
