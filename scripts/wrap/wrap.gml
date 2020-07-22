///@func wrap(val,min,max)
///@desc Returns the value wrapped, if it is above or below the threshold it will wrap around
///@arg val
///@arg min
///@arg max
var _min = min(argument1,argument2); //Built in error correction!
var _max = max(argument1,argument2);
var _val = argument0 - argument1;

var _range = _max - _min;
_range++;

return _val - floor(_val / _range) * _range + _min;
