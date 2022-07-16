if (room = rmCombat) {
	nextRoom = noone;
	
	//ds_list_add(enemyList, AddEnemy(448, 128, "Drone", objDrone, [Beam]));
	//ds_list_add(enemyList, AddEnemy(448, 288, "Drone", objDrone, [Rocket]));
	ds_list_add(enemyList, AddEnemy(540, 160, "Enemy", objMech, [Melee]));
	CreatePlayer(87, 108, objManager.gameData.player);
	
	if seqRivalAppears == noone {
		seqRivalAppears = layer_sequence_create(layer_get_id("Sequences"), screenWidth/2, screenHeight/2, sqRivalAppears);
		layer_sequence_pause(seqRivalAppears);	
	}
}