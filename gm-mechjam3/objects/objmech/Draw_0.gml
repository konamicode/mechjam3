DrawWeapon();


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c, image_alpha);
draw_set_color(c);	

if global.debug {
	draw_healthbar(x - (maxHp * 2), y + sprite_height + 2, x + (maxHp * 2), y + sprite_height + 6, (hp/maxHp * 100), c_black, c_red, c_green, 0, false, true);
	if (hp < 30)
	{
		show_debug_message("break");
	}
	draw_line_colour(x + lengthdir_x(weapon.range.minDist, aimDir), 
		y + lengthdir_y(weapon.range.minDist, aimDir), 
		x + lengthdir_x(weapon.range.maxDist, aimDir), 
		y + lengthdir_y(weapon.range.maxDist, aimDir), 
		c_blue, c_blue);


}


for ( var i = 0; i < ds_list_size(components); i++) {
	var comp = components[| i];
	with (comp)
		event_perform(ev_draw, 0);	
}