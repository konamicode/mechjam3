if (room == rmCombat) {
	if !is_undefined(enemyPool)
		ds_list_destroy(enemyPool);
	ds_list_destroy(spawnList);
	
	if (mpGrid != noone)
	{
		mp_grid_destroy(mpGrid);
		mpGrid = noone;
	}
}