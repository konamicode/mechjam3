image_xscale = (right + left)/2;
image_yscale = (bottom + top)/2;

draw_self();
draw_rectangle_color(bbox_left, bbox_top, bbox_right, bbox_bottom, c_red, c_red, c_red, c_red, true);

if global.debug {
	draw_set_alpha(0.5);
	draw_rectangle_color(x - left, y - top, x + right, y + bottom, 
							c_red, c_orange, c_orange, c_red, false);
	draw_set_alpha(1.0);							
}

