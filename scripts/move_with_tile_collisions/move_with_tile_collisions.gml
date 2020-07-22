///@func move_with_tile_collisions(tilemap,x_speed,y_speed)
///@desc Detects collision tiles and moves/doesn't as you need them to, also returns a new x/y speed if needed for animation and such
///@arg tilemap
///@arg x_speed
///@arg y_speed
var _tilemap = argument0;
var _x_speed = argument1;
var _y_speed = argument2;

#region Horizontal Collisions
if(_x_speed != 0) {
	var _break,_proposed_tile,_bbox_check,_target_x,_target_y,_mask_cell_height,_cell_step,_x_stride;
	_cell_step =			abs(_x_speed) >> TILE_POW;						//How many cells am I traversing? Typically 0 unless you're moving at some crazy speed
	_mask_cell_height =		((bbox_bottom - bbox_top) >> TILE_POW) + 1;		//How many cells tall is the sprite mask?
	_break =				false;											//Break out of our outer loop
	
	for(var i=0; i<=_cell_step; i++) {
		for(var j=_mask_cell_height; j>=0; j--) {
			_bbox_check =		(_x_speed > 0) ? bbox_right : bbox_left;										//Which side am I checking for a collision on (for solids), updated each frame as we move around
			_x_stride =			i == 0 ? (_x_speed mod TILE_SIZE) : (TILE_SIZE * sign(_x_speed));				//How far in the x direction we're moving on this loop, we do the small part first then any remaining full tile jumps.
			_target_x =			_bbox_check + _x_stride;														//Which side of our character will be checking for a solid collision
			_target_y =			max(bbox_bottom - (j * TILE_SIZE),bbox_top);									//Jumps up by 1 tile each loop, maxing out at the bbox_top of the character so there's never less than TILE_SIZE pixels not covered by a collision check
			
			#region Solid Check
			_proposed_tile = tilemap_get_at_pixel(_tilemap,_target_x,_target_y);
			
			if(_proposed_tile == TILE_TYPE.solid) {
				//When we hit a solid, snap our bbox to the solids surface, set our speed to 0, set the outside of our double loop to a value which will end it (as we don't need to check for further collisions)
				x = (_x_speed > 0) ? (_target_x div TILE_SIZE * TILE_SIZE) + (x - _bbox_check - 1) : (_target_x div TILE_SIZE * TILE_SIZE) + TILE_SIZE + (x - _bbox_check); //Right if true, otherwise left, snap to the cell we're trying to move into
				_x_speed = 0;
				_break = true;
				
				break;
			}
			#endregion
		}
		
		if(_break) { break; }
		x += _x_stride;
	}
}
#endregion

#region Vertical Collisions
if(_y_speed != 0) {
	var _break,_mask_height,_proposed_tile,_current_tile,_bbox_check,_target_x,_target_y,_mask_cell_width,_cell_step,_y_stride;
	_cell_step =			abs(_y_speed) >> TILE_POW;						//How many cells am I traversing? Typically 0 unless you're moving at some crazy speed
	_mask_cell_width =		((bbox_right - bbox_left) >> TILE_POW) + 1;		//How many cells wide is the sprite mask?
	_mask_height =			bbox_bottom - bbox_top;							//How tall is my mask
	_break =				false;											//Break out of our outer loop
	
	//Similar to the x collisions, we start at the left of our characters side, creating collision points along the base/top of the character at each tile start
	for(var i=0; i<=_cell_step; i++) {
		for(var j=0; j<=_mask_cell_width; j++) {
			_bbox_check =		(_y_speed > 0) ? bbox_bottom : bbox_top;										//The current y remains consistent across the x axis while checking all collision points
			_y_stride =			i == 0 ? (_y_speed mod TILE_SIZE) : (TILE_SIZE * sign(_y_speed));				//How far we're moving in this loop, small part first, then any full tile moves on successive loops
			_target_x =			min(bbox_left + (j * TILE_SIZE),bbox_right);									//Pretty much the same as how it's handled in horizontal movement, but now for X
			_target_y =			_bbox_check + _y_stride;														//Also same
			
			#region Solid Check
			_proposed_tile =			tilemap_get_at_pixel(_tilemap,_target_x,_target_y);
			
			//If we're on a non-slope tile (at our midpoint) and we're trying to move onto a solid tile, then snap to it. Basically we're ignoring solids if we're on a slope
			if(_proposed_tile == TILE_TYPE.solid) {
				y = _y_speed > 0 ? ((_target_y >> TILE_POW) * TILE_SIZE - 1) : ((_target_y >> TILE_POW) + 1) * TILE_SIZE + _mask_height;
				_y_speed = 0;
				_break = true;
				break;
			
			//Collide with platforms, but only when going down
			} else if((_y_speed > 0) && (_proposed_tile == TILE_TYPE.platform) && (_current_tile != TILE_TYPE.platform)) {
				y = (_target_y >> TILE_POW) * TILE_SIZE - 1;
				_y_speed = 0;
				_break = true;
				break;
			
			//This collision allows you to jump on top of ladders without falling through them, basically treating them like platforms
			} else if((_y_speed > 0) && (_proposed_tile == TILE_TYPE.ladder) && (_current_tile != TILE_TYPE.ladder)) {
				y = (_target_y >> TILE_POW) * TILE_SIZE - 1;
				_y_speed = 0;
				_break = true;
				break;
			}
			
			//We could put a check in here for ceiling tiles, so that we can walk on top of them if they're under us like a platform, I'll save that for the next version though
			#endregion
		}
		
		if(_break) { break; }
		y += _y_stride;
	}
}
#endregion

return [_x_speed,_y_speed];
