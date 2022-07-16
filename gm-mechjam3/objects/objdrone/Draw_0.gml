
draw_self();


if global.debug {
	draw_healthbar(x - (maxHp), y + sprite_height + 2, x + (maxHp), y + sprite_height + 6, (hp/maxHp * 100), c_black, c_red, c_green, 0, false, true);
	draw_line_colour(x + lengthdir_x(weapon.range.minDist, aimDir), 
	y + lengthdir_y(weapon.range.minDist, aimDir), 
	x + lengthdir_x(weapon.range.maxDist, aimDir), 
	y + lengthdir_y(weapon.range.maxDist, aimDir), 
		c_blue, c_blue);
}