if (room == rmCombat) {
	ds_list_destroy(enemyPool);
	ds_list_destroy(spawnList);
	ds_list_clear(enemyList);
	if (mpGrid != noone)
	{
		mp_grid_destroy(mpGrid);
		mpGrid = noone;
	}
}