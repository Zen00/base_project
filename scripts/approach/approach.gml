///@func approach(current,target,amount)
///@desc Takes the given value to the target value by the amount
///@arg current
///@arg target
///@arg amount
var _current = argument0;
var _target = argument1;
var _amount = argument2;

return _current < _target ? min(_current + _amount,_target) : max(_current - _amount,_target);
