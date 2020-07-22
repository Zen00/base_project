/// @description 

//Add states as desired for different game scenes, such as only allowing a/b for an interactive cutscene or some such
enum INPUT_STATES {
	none,
	standard
}

//State
state_ = INPUT_STATES.standard;

//Gamepad setup
//In this setup, if there is any gamepad connected, it will become the default control device
//If multiple gamepads are connected, it will slightly randomly choose which one to use (whichever is detected last)
gp_id_ = noone;

#region Inputs
//While not necessary, I have initialized these variables with keyboard commands (for reference) instead of 0s
//Keyboard setup, for rebindables. Rebind by setting these variables to desired values from whatever menu system you make
key_right_				= ord("D");
key_up_					= ord("W");
key_left_				= ord("A");
key_down_				= ord("S");
key_a_					= ord("K");
key_b_					= ord("J");
key_x_					= ord("I");
key_y_					= ord("U");
key_l_					= ord("Y");
key_r_					= ord("O");
key_start_				= vk_enter;
key_select_				= vk_rshift;

//Gamepad setup, same deal as keyboard
gp_right_				= gp_padr;
gp_up_					= gp_padu;
gp_left_				= gp_padl;
gp_down_				= gp_padd;
gp_a_					= gp_face2;
gp_b_					= gp_face1;
gp_x_					= gp_face4;
gp_y_					= gp_face3;
gp_l_					= gp_shoulderl;
gp_r_					= gp_shoulderr;
gp_start_				= gp_start;
gp_select_				= gp_select;

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
#endregion
