///@func tile_place_meeting(x,y,layer)
///@desc Moves around a collision object to our location for quick tile-directed collision testing
///@auth Pixelated_Pope (comments by Zen00 and minor edits for preference)
///@arg x
///@arg y
///@arg layer
var _layer = argument2,
    _tm = layer_tilemap_get_id(_layer),
    _checker = obj_tile_checker;

//Failsafes
if(!instance_exists(_checker)) { instance_create_depth(0,0,0,_checker); }
if((_tm == -1) || (layer_get_element_type(_tm) != layerelementtype_tilemap)) { show_debug_message("Checking for collisions on non-existant layer / tilemap"); return false; }

//Retrieve the x/y cell numbers (x/y + given offset) at top/bottom/left/right that our hit mask is touching
var _x1 = tilemap_get_cell_x_at_pixel(_tm, bbox_left		+ (argument0 - x), y),
    _y1 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_top		+ (argument1 - y)),
    _x2 = tilemap_get_cell_x_at_pixel(_tm, bbox_right		+ (argument0 - x), y),
    _y2 = tilemap_get_cell_y_at_pixel(_tm, x, bbox_bottom	+ (argument1 - y));

//Move our tile checker over every single cell we're touching
//Most of these will be the empty air tiles so won't really do anything (return 0 to _tile) so are skipped before moving out tile checker
//Anything greater than 0 (greater than tile index 0) is treated as "true" so gets a more thourough checking
for(var i=_x1; i<=_x2; i++) {
	for(var j=_y1; j<=_y2; j++) {
		var _tile = tile_get_index(tilemap_get(_tm, i, j));
		if(_tile) {
			if(_tile == 1) { return true; } //If we detect a solid, we must be touching it since solid covers the entire cell, no need for thourough tile checking
			
			//Okay, a collision that's not a solid is in this place (probably a slope) so lets break out the heavy gun (eg: the tile checker object)
			//We position the tile checker at the current cell we're checking and set its image index (hit mask) to the same as the tile
			_checker.x = i * tilemap_get_tile_width(_tm);
			_checker.y = j * tilemap_get_tile_height(_tm);
			_checker.image_index = _tile;
			
			//If a hit is detected, return the tile number that we hit (effectively true) for further uses if needed
			if(place_meeting(argument0, argument1, _checker)) { return _tile; }
		}
	}
}

return false;
