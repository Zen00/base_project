///@func simple_load(fname)
///@desc A simple load script
///@arg fname
var _fname = argument0;

//Failsafe, returns noone so we can tell if we didn't have a save file
if(!file_exists(_fname)) { return noone; }

//Open and read out the save information
var _load_map = ds_map_create();
var _file = file_text_open_read(_fname);
ds_map_read(_load_map,file_text_read_string(_file));

//Write our save information back into the game
//variable_name_ = real(ds_map_find_value(_load_map,"map_name")); //An example of loading variables from the map back into our game, you'll need to specify if values are reals or strings or bools (mainly for secure saved stuff that was stored as a JSON)

//Cleanup
file_text_close(_fname);
ds_map_destroy(_load_map);
