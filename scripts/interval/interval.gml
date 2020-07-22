///@func interval(interval,timer)
///@desc Return true 50% of the desired timespan
///@param interval
///@param timer
var _interval = argument0;
var _timer = argument1;

return (_timer % _interval) <= (_interval / 2);
