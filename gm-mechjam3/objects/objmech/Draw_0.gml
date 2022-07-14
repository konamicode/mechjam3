DrawWeapon();


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c, image_alpha);
draw_set_color(c);	
draw_healthbar(x - sprite_width/2, y + sprite_height + 2, x + sprite_width/2, y + sprite_height + 10, (hp/maxHp * 100), c_black, c_red, c_green, 0, false, true);

for ( var i = 0; i < ds_list_size(components); i++) {
	var comp = components[| i];
	with (comp)
		event_perform(ev_draw, 0);	
}