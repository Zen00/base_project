///@func animation_end()
///@desc Returns true when the current sprite ends its animation

//Broke this up into vars for debugging purposes
var _a = image_index;
var _b = image_speed * sprite_get_speed(sprite_index);
var _c = (sprite_get_speed_type(sprite_index) == spritespeed_framespergameframe ? 1 : room_speed);
var _d = image_number;

//A hacky animation end check if you set the image speed = 0
//This should work for most use cases I think
if((_b == 0) && (_a >= _d - 1)) {
	return true;
}

return _a + _b / _c >= _d;
