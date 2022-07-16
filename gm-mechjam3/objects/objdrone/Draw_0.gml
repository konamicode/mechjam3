
draw_self();

	draw_healthbar(x - (maxHp), y + sprite_height + 2, x + (maxHp), y + sprite_height + 6, (hp/maxHp * 100), c_black, c_red, c_green, 0, false, true);