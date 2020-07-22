///@func choose_percent(val,chance,...,[default])
///@desc Returns a chosen value with the given weights. Normalized from 0-0.999999 (decimal percent)
///@arg val
///@arg chance
///@arg ...
///@arg [default]
var _count = argument_count;

//Loop through the arguments, adding values and chances to an array
var i=0;
var _value = [];
var _chance = [];
while(_count > 1) {
	_value[i] = argument[i*2];
	_chance[i] = argument[i*2+1];
	_count -= 2;
	i++;
}
var _total = i;

//Find out if there's a default value
var _default = 0;
if(_count == 1) {
	_default = argument[i*2];
}

//Loop through the values, checking for a random win
var _choice = _default;
var _index = 0;
var _rand = random(1);
for(var i=0; i<_total; i++) {
	_index += _chance[i];
	if(_rand < _index) {
		_choice = _value[i];
		break;
	}
}

return _choice;
