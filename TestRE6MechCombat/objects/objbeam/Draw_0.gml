

if image_index > 0
	draw_sprite_ext(sprite_index, image_index - 1, x, y, (width )/sprite_width, 1, image_angle, image_blend, image_alpha);

gpu_set_blendmode(bm_add)
draw_sprite_ext(sprite_index, image_index - 1, x, y, (width )/sprite_width, 1, image_angle, image_blend, image_alpha);

gpu_set_blendmode(bm_normal);

//var _c = draw_get_color();
//draw_set_color(c_red);
//draw_arrow(x, y, x + lengthdir_x(width, image_angle), y +  + lengthdir_y(width, image_angle), 4);
//draw_set_color(_c);