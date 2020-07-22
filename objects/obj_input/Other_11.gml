/// @description Standard movement

if(gp_id_ == noone) {
	//Pressed events
	 right_pressed_			= keyboard_check_pressed(key_right_);
	    up_pressed_			= keyboard_check_pressed(key_up_);
	  left_pressed_			= keyboard_check_pressed(key_left_);
	  down_pressed_ 		= keyboard_check_pressed(key_down_);
	     a_pressed_			= keyboard_check_pressed(key_a_);
	     b_pressed_			= keyboard_check_pressed(key_b_);
	     x_pressed_			= keyboard_check_pressed(key_x_);
	     y_pressed_			= keyboard_check_pressed(key_y_);
	     l_pressed_			= keyboard_check_pressed(key_l_);
	     r_pressed_			= keyboard_check_pressed(key_r_);
	 start_pressed_			= keyboard_check_pressed(key_start_);
	select_pressed_			= keyboard_check_pressed(key_select_);

	//Hold events
	 right_held_			= keyboard_check(key_right_);
	    up_held_			= keyboard_check(key_up_);
	  left_held_			= keyboard_check(key_left_);
	  down_held_ 			= keyboard_check(key_down_);
	     a_held_			= keyboard_check(key_a_);
	     b_held_			= keyboard_check(key_b_);
	     x_held_			= keyboard_check(key_x_);
	     y_held_			= keyboard_check(key_y_);
	     l_held_			= keyboard_check(key_l_);
	     r_held_			= keyboard_check(key_r_);
	 start_held_			= keyboard_check(key_start_);
	select_held_			= keyboard_check(key_select_);

	//Released events
	 right_released_		= keyboard_check_released(key_right_);
	    up_released_		= keyboard_check_released(key_up_);
	  left_released_		= keyboard_check_released(key_left_);
	  down_released_ 		= keyboard_check_released(key_down_);
	     a_released_		= keyboard_check_released(key_a_);
	     b_released_		= keyboard_check_released(key_b_);
	     x_released_		= keyboard_check_released(key_x_);
	     y_released_		= keyboard_check_released(key_y_);
	     l_released_		= keyboard_check_released(key_l_);
	     r_released_		= keyboard_check_released(key_r_);
	 start_released_		= keyboard_check_released(key_start_);
	select_released_		= keyboard_check_released(key_select_);
} else {
	//Pressed events
	 right_pressed_			= gamepad_button_check_pressed(gp_id_,gp_right_);
	    up_pressed_			= gamepad_button_check_pressed(gp_id_,gp_up_);
	  left_pressed_			= gamepad_button_check_pressed(gp_id_,gp_left_);
	  down_pressed_ 		= gamepad_button_check_pressed(gp_id_,gp_down_);
	     a_pressed_			= gamepad_button_check_pressed(gp_id_,gp_a_);
	     b_pressed_			= gamepad_button_check_pressed(gp_id_,gp_b_);
	     x_pressed_			= gamepad_button_check_pressed(gp_id_,gp_x_);
	     y_pressed_			= gamepad_button_check_pressed(gp_id_,gp_y_);
	     l_pressed_			= gamepad_button_check_pressed(gp_id_,gp_l_);
	     r_pressed_			= gamepad_button_check_pressed(gp_id_,gp_r_);
	 start_pressed_			= gamepad_button_check_pressed(gp_id_,gp_start_);
	select_pressed_			= gamepad_button_check_pressed(gp_id_,gp_select_);

	//Hold events
	 right_held_			= gamepad_button_check(gp_id_,gp_right_);
	    up_held_			= gamepad_button_check(gp_id_,gp_up_);
	  left_held_			= gamepad_button_check(gp_id_,gp_left_);
	  down_held_ 			= gamepad_button_check(gp_id_,gp_down_);
	     a_held_			= gamepad_button_check(gp_id_,gp_a_);
	     b_held_			= gamepad_button_check(gp_id_,gp_b_);
	     x_held_			= gamepad_button_check(gp_id_,gp_x_);
	     y_held_			= gamepad_button_check(gp_id_,gp_y_);
	     l_held_			= gamepad_button_check(gp_id_,gp_l_);
	     r_held_			= gamepad_button_check(gp_id_,gp_r_);
	 start_held_			= gamepad_button_check(gp_id_,gp_start_);
	select_held_			= gamepad_button_check(gp_id_,gp_select_);

	//Released events
	 right_released_		= gamepad_button_check_released(gp_id_,gp_right_);
	    up_released_		= gamepad_button_check_released(gp_id_,gp_up_);
	  left_released_		= gamepad_button_check_released(gp_id_,gp_left_);
	  down_released_ 		= gamepad_button_check_released(gp_id_,gp_down_);
	     a_released_		= gamepad_button_check_released(gp_id_,gp_a_);
	     b_released_		= gamepad_button_check_released(gp_id_,gp_b_);
	     x_released_		= gamepad_button_check_released(gp_id_,gp_x_);
	     y_released_		= gamepad_button_check_released(gp_id_,gp_y_);
	     l_released_		= gamepad_button_check_released(gp_id_,gp_l_);
	     r_released_		= gamepad_button_check_released(gp_id_,gp_r_);
	 start_released_		= gamepad_button_check_released(gp_id_,gp_start_);
	select_released_		= gamepad_button_check_released(gp_id_,gp_select_);	
}

#region Input Buffers
if(a_pressed_) { alarm[0] = 2; }
if(alarm[0] > 0) { a_pressed_ = true; }

if(b_pressed_) { alarm[1] = 2; }
if(alarm[1] > 0) { b_pressed_ = true; }
#endregion
