
draw_self();


if global.debug {
	draw_healthbar(x - (maxHp/2), y + sprite_height + 2, x + (maxHp/2), y + sprite_height + 6, (hp/maxHp * 100), c_black, c_red, c_green, 0, false, true);
	draw_healthbar(x - (maxStamina/2), y + sprite_height + 10, x + (maxStamina/2), y + sprite_height + 14 , (stamina/maxStamina) * 100, 
		c_black, c_blue, c_blue, 0, true, true);
	draw_line_colour(x + lengthdir_x(weapon.range.minDist, aimDir), 
	y + lengthdir_y(weapon.range.minDist, aimDir), 
	x + lengthdir_x(weapon.range.maxDist, aimDir), 
	y + lengthdir_y(weapon.range.maxDist, aimDir), 
		c_blue, c_blue);
	draw_text(x, y - sprite_yoffset - 20, string(action) + ":" + string(alarm_get(1)));		
}