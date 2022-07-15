
draw_self();

if (global.debug)
	draw_healthbar(x - sprite_width/2, y + sprite_height + 2, x + sprite_width/2, y + sprite_height + 6, (hp/maxHp * 100), c_black, c_red, c_green, 0, false, true);