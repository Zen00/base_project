///@func move_with_object_collisions(collision_object,x_speed,y_speed)
///@desc Detects collision objects and moves/doesn't as you need them to, also returns a new x/y speed if needed for animation and such
///@arg collision_object
///@arg x_speed
///@arg y_speed
var _obj = argument0;
var _x_speed = argument1;
var _y_speed = argument2;

//By preferring x movement over y when going down, we ensure the player will end up landing on a ledge instead of falling down the cliff
//By preferring y movement over x when going up, we ensure the player will slide up a ledge instead of bouncing off the bottom, making it easier to get onto platforms
//This is of course entirely up to preference
//These collisions do not actually affect your real x/y position as we're passing through the speeds to our tiles collisions script for finalization before finishing

if(_y_speed > 0) { //Going down
#region X Over Y
if(place_meeting(x + _x_speed,y + _y_speed,_obj)) {
	while(place_meeting(x + _x_speed,y,_obj)) { _x_speed = approach(_x_speed,0,1); }
	while(place_meeting(x + _x_speed,y + _y_speed,_obj) && (_y_speed > 0)) { _y_speed--; }
}
#endregion
} else { //Going up
#region Y Over X
if(place_meeting(x + _x_speed,y + _y_speed,_obj)) {
	while(place_meeting(x,y + _y_speed,_obj) && (_y_speed < 0)) { _y_speed++; }
	while(place_meeting(x + _x_speed,y + _y_speed,_obj)) { _x_speed = approach(_x_speed,0,1); }
}
#endregion
}

return [_x_speed,_y_speed];
