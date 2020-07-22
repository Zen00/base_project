/// @description 

//Debug code so you can see which event has been triggered and the pad associated with it
var _event = async_load[? "event_type"];
var _id = async_load[? "pad_index"];
show_debug_message("Event = " + _event);
show_debug_message("Pad = " + string(_id));

//Parse the async_load map to see which event has been triggered
switch(_event) {
	case "gamepad discovered":
		gp_id_ = _id;
		#region These are corrections for the inputs for my controller, which apparently isn't supported by GMS2, you can use them to fix your controllers as needed
		if(gamepad_get_guid(gp_id_) == "a30622f6000000000000504944564944") {
			show_debug_message("GP MAPPING: " + gamepad_get_mapping(gp_id_));
			show_debug_message("GP GUID: " + gamepad_get_guid(gp_id_)); //Move this outside the if statement to get your controllers GUID
			show_debug_message("GP DESCRIPTION: " + gamepad_get_description(gp_id_));
			var _mapping = gamepad_get_guid(gp_id_) + "," + gamepad_get_description(gp_id_);
			#region Mapping, it's really tall so it's easier to see each individual key
			_mapping += @"
			,a:b1
			,b:b2
			,x:b0
			,y:b3
			,leftshoulder:b4
			,rightshoulder:b5
			,start:b9
			,guide:b8
			,dpright:h0.2
			,dpup:h0.1
			,dpleft:h0.8
			,dpdown:h0.4
			,leftx:a0
			,lefty:a1
			,rightx:a2
			,righty:a4
			";
			#endregion
			gamepad_test_mapping(gp_id_,_mapping);
		}
		#endregion
		gamepad_set_axis_deadzone(gp_id_, 0.1); //This should be user set-able in certain modern game types
		gamepad_set_button_threshold(gp_id_, 0.1); //As would this
	break;
	case "gamepad lost":
		//Only disconnect the gamepad if it's the one our game is using
		if(gp_id_ == _id) { gp_id_ = noone; }
	break;
}
