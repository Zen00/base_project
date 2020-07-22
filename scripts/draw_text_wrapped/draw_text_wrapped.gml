///@func draw_text_wrapped(string,width,hyphenation)
///@desc Returns a formatted version of your text that has been word-wrapped at a space, or if desired hyphenated words (note: set your font before doing this)
///@arg string
///@arg width
///@arg hyphenation
var _str = argument0;
var _width = argument1;
var _hyphenation = argument2;

var _pos_space = -1,
	_pos_current = 1,
	_text_output = "";

//While our starting string has more than 1 character, chip out bits of it into a formatted export string
while(string_length(_str) >= _pos_current) {
	//Have we reached the end of a line yet?
	if(string_width(string_copy(_str,1,_pos_current)) > _width) {
		//Split on the last space detected
		if((_pos_space != -1) && !_hyphenation) {
			_text_output += string_copy(_str,1,_pos_space) + "\n";
			_str = string_copy(_str,_pos_space+1,string_length(_str) - _pos_space);
			_pos_current = 1;
			_pos_space = -1;
		
		//Split mid-word and insert a hyphen
		} else if(_hyphenation) {
			_text_output += string_copy(_str,1,_pos_current-2) + "-\n";
			_str = string_copy(_str,_pos_current,string_length(_str) - (_pos_current-2));
			_pos_current = 1;
			_pos_space = -1;
			
		//And if all else fails, force a line break
		} else {
			_text_output += string_copy(_str,1,_pos_current-1) + "\n";
			_str = string_copy(_str,_pos_current,string_length(_str) - (_pos_current-1));
			_pos_current = 1;
			_pos_space = -1;
		}
	}

	//Space detection, for clean cutting
	if(string_char_at(_str,_pos_current) == " ") { _pos_space = _pos_current; }
	_pos_current++;
}

//Tailings (the leftover bit of string)
if(string_length(_str) > 0) { _text_output += _str; }

return _text_output;
