if global.debug {
	draw_set_alpha(0.5);
	draw_rectangle_color(x - left, y - top, x + right, y + bottom, 
							c_red, c_orange, c_orange, c_red, false);
	draw_set_alpha(1.0);							
}