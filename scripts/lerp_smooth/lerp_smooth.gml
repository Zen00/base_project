///@func lerp_smooth(val1,val2,amount)
///@desc Adds a cutoff point to lerp movement so that you don't end up with unlimited decimal places, which causes sub-pixel jitter
///@arg val1
///@arg val2
///@arg amount
var _val1 = argument0;
var _val2 = argument1;
var _amount = argument2;

var _diff = _val2 - _val1;
if(abs(_diff) < 0.0005) {
	return _val2;
} else {
	lerp(_val1,_val2,_amount);
}
