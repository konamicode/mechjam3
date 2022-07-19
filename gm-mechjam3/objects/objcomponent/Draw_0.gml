if (global.debug)
{
	image_alpha = 0.6;
	draw_self();
	draw_healthbar(x - (hp/2), y - 10, x + (hp/2), y - 8, (hp/maxHp) * 100, c_gray, c_orange, c_yellow, 0, true, true);
}