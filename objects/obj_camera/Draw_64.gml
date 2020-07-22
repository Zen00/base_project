///@description 

if(global.DEBUG) {
	draw_set_font_ext(global.FONT,fa_left,fa_top,c_white,1);
	display_write_all_specs(4,4);
	draw_text(32,128,"X "+string(x));
	draw_text(32,144,"Y "+string(y));
}
