if (room = rmCombat) {
	nextRoom = noone;
	
	ds_list_add(enemyList, AddEnemy(448, 128, "Drone", objDrone, [Beam]));
	ds_list_add(enemyList, AddEnemy(448, 288, "Drone", objDrone, [Rocket]));
	CreatePlayer(87, 108, objManager.gameData.player);
}