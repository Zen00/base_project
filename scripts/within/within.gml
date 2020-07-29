///@func within(val,min,max)
///@desc Returns true if the given value is within the given bounds (inclusive)
///@arg variable
///@arg val
///@arg within
var _val = argument0;
var _min = argument1;
var _max = argument2;

var _within = clamp(_val,_min,_max) == _val;
return _within;
