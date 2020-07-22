///@func simple_save(fname)
///@desc A simple save system
///@arg fname
var _fname = argument0;

//Delete the previous version of the file
if(file_exists(_fname)) { file_delete(_fname); }

//Add items to our save map
var _save_map = ds_map_create();
//ds_map_add(_save_map,"map_name",variable_name_); //This is an example of a variable to be saved into our save map, you'll want to remember this stuff for the load

//Write it
var _file = file_text_open_write(_fname); //Open/create a new save file for writing
file_text_write_string(_file,ds_map_write(_save_map));

//Cleanup
file_text_close(_file);
ds_map_destroy(_save_map);
