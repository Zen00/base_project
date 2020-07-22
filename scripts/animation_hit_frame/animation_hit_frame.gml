///@func animation_hit_frame(frame)
///@desc Returns true when you finally reach your desired frame
///@arg frame
var _frame = argument0;

var _speed = game_get_speed(gamespeed_fps) / sprite_get_speed(sprite_index);

return (image_index >= _frame - image_speed / _speed) && (image_index < _frame+1);
