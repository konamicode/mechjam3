draw_self();

draw_sprite_ext(sprHexArrow, 0, x, y, 1, 1, facingDirection, image_blend, 1);

if (global.debug)

	draw_text_color(x , y, string(mapX) + ":" + string(mapY), c_purple, c_purple, c_purple, c_purple,1);