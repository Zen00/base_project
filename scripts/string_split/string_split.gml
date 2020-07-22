///@func string_split(string,delimiter)
///@desc Returns a list of strings created from the input string
///@arg string
///@arg delimiter
var _str = argument0;
var _del = argument1;

var _list = ds_list_create();
var _num = string_count(_del,_str);
if(_num == 0) {
	ds_list_add(_list,_str);
} else {
	for(var i=0; i<_num; i++) {
		var _pos = string_pos(_del,_str);
		ds_list_add(_list,string_copy(_str,1,_pos-1));
		_str = string_delete(_str,1,_pos);
	}
	
	ds_list_add(_list,_str);
}

return _list;
