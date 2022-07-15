if (room = rmCombat) {
	nextRoom = noone;
	
	ds_list_add(enemyList, AddEnemy(448, 128));
	ds_list_add(enemyList, AddEnemy(448, 288, objDrone));
	CreatePlayer(87, 108, objManager.gameData.player);
}