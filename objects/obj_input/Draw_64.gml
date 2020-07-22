/// @description 
/*
#region Input debugging
if(global.DEBUG && (gp_id_ != noone))
{
	var _spacing = 8;
	var i = 0;
	draw_set_color(c_green);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);

	draw_text(8,8+(i++*_spacing),"GP ID: "				+ string(gp_id_));
	draw_text(8,8+(i++*_spacing),"BUTTON COUNT: "		+ string(gamepad_button_count(gp_id_)));
	draw_text(8,8+(i++*_spacing),"RIGHT PRESS: "		+ string(right_held_));
	draw_text(8,8+(i++*_spacing),"UP PRESS: "			+ string(up_held_));
	draw_text(8,8+(i++*_spacing),"LEFT PRESS: "			+ string(left_held_));
	draw_text(8,8+(i++*_spacing),"DOWN PRESS: "			+ string(down_held_));
	draw_text(8,8+(i++*_spacing),"A PRESS: "			+ string(a_held_));
	draw_text(8,8+(i++*_spacing),"B PRESS: "			+ string(b_held_));
	draw_text(8,8+(i++*_spacing),"X PRESS: "			+ string(x_held_));
	draw_text(8,8+(i++*_spacing),"Y PRESS: "			+ string(y_held_));
	draw_text(8,8+(i++*_spacing),"L PRESS: "			+ string(l_held_));
	draw_text(8,8+(i++*_spacing),"R PRESS: "			+ string(r_held_));
	draw_text(8,8+(i++*_spacing),"START PRESS: "		+ string(start_held_));
	draw_text(8,8+(i++*_spacing),"SELECT PRESS: "		+ string(select_held_))
}
#endregion
