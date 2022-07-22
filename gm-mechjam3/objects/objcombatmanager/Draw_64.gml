if ( global.debug && room == rmCombat)
{
	if mpGrid != noone {
		draw_set_alpha(0.3);
		mp_grid_draw(mpGrid);
		draw_set_alpha(1);
	}
	
}
