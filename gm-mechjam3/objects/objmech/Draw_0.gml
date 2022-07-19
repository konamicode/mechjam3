DrawWeapon();


draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c, image_alpha);
draw_set_color(c);	

if global.debug {
	draw_healthbar(x - (maxHp/ 2 ), y + sprite_height + 2, x + (maxHp/2), y + sprite_height + 6, (hp/maxHp) * 100, c_black, c_red, c_green, 0, false, true);
	draw_healthbar(x - (maxStamina/2), y + sprite_height + 10, x + (maxStamina/2), y + sprite_height + 14 , (stamina/maxStamina) * 100, 
		c_black, c_blue, c_blue, 0, true, true);
	var _aim = aimDir;
	if (weapon.type == weaponType.melee) {
		_aim = point_direction(0, 0, image_xscale, 0);
	}

	draw_line_colour(x + lengthdir_x(weapon.range.minDist, _aim), 
		y + lengthdir_y(weapon.range.minDist, _aim), 
		x + lengthdir_x(weapon.range.maxDist, _aim), 
		y + lengthdir_y(weapon.range.maxDist, _aim), 
		c_blue, c_blue);
	draw_text(x, y - sprite_yoffset - 20, string(action) + ":" + string(alarm_get(1)));
	draw_text(x, y - sprite_yoffset - 10, "stun :" + string(alarm_get(2)));


}


for ( var i = 0; i < ds_list_size(components); i++) {
	var comp = components[| i];
	with (comp)
		event_perform(ev_draw, 0);	
}