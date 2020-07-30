///@func tile_position_meeting(x,y,layer)
///@desc Moves around a collision object to our location for precision testing
///@auth Zen00 (Pixelated_Pope's tile_meeting_precise script was used as a base)
///@arg x
///@arg y
///@arg layer
var _layer = argument2,
    _tm = layer_tilemap_get_id(_layer),
    _checker = obj_tile_checker;

//Failsafes
if(!instance_exists(_checker)) { instance_create_depth(0,0,0,_checker); }
if((_tm == -1) || (layer_get_element_type(_tm) != layerelementtype_tilemap)) { show_debug_message("Checking for collisions on non-existant layer / tilemap"); return false; }

//Find the cell position my point is touching
var xx = tilemap_get_cell_x_at_pixel(_tm,argument0,argument1),
    yy = tilemap_get_cell_y_at_pixel(_tm,argument0,argument1);

//If the tile isn't 0 (empty air, 0 also is a "false"), then check to see if we're touching it
var _tile = tile_get_index(tilemap_get(_tm,xx,yy));
if(_tile) {
	//Return true immediately if we're hitting a solid, as a solid covers the entire cell
	if(_tile == 1) { return true; }
	
    //Position our checking object at our point cell and set the image index to our tile
    _checker.x = xx * tilemap_get_tile_width(_tm);
    _checker.y = yy * tilemap_get_tile_height(_tm);
    _checker.image_index = _tile;
    
    //Finally check to see if there is a meeting (as _tile is greater than 1, it's effectively "true" for later use downstream)
    if(position_meeting(argument0,argument1,_checker)) { return _tile; }
}

return false;
