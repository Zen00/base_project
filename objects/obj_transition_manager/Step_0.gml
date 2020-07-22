///@description 

if(mode_ == TRANS_MODE.off) { exit; }

//If intro-ing, go from black to visible, else the other direction
if(mode_ == TRANS_MODE.intro) { alpha_ = max(0,alpha_ - max((alpha_ * 0.1),spd_)); }
else { alpha_ = min(alpha_target_,alpha_ + max(((alpha_target_ - alpha_) * 0.1),spd_)); }

//When I've reached max black or full visibility, check what I should do next
if((alpha_ >= alpha_target_) || (alpha_ <= 0)) {
	switch(mode_) {
		case TRANS_MODE.intro: //If we just became fully visible
			mode_ = TRANS_MODE.off;
			obj_input.state_ = INPUT_STATES.standard; //Returns controls to normal once the transition is over
		break;
		case TRANS_MODE.next:
			mode_ = TRANS_MODE.intro;
			room_goto_next();
		break;
		case TRANS_MODE.goto:
			mode_ = TRANS_MODE.intro;
			room_goto(target_);
		break;
		case TRANS_MODE.restart: //Restart/quit the game once we go full black
			game_restart();
		break;
		case TRANS_MODE.room_reset: //Restart the room once we go full black
			mode_ = TRANS_MODE.intro;
			room_restart();
		break;
		case TRANS_MODE.quit:
			game_end();
		break;
	}
}
