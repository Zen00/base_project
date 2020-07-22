///@func lerp_smooth(val1,val2,amount,[cutoff])
///@desc Adds a cutoff point to lerp movement so that you don't end up with unlimited decimal places, which causes sub-pixel jitter
///@arg val1
///@arg val2
///@arg amount
///@arg [cutoff]
var _val1 = argument[0];
var _val2 = argument[1];
var _amount = argument[2];
var _cutoff = argument_count > 3 ? argument[3] : 0.0005;

return (abs(_val1 - _val2) < _cutoff) ? _val2 : lerp(_val1,_val2,_amount); 
