///@func within(val,min,max)
///@desc Returns true if the given value is within the given bounds (non-inclusive)
///@arg variable
///@arg val
///@arg within
var _val = argument0;
var _min = argument1;
var _max = argument2;

var _within = ((_val > _min) && (_val < _max));
return _within;
