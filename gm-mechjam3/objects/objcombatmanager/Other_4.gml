if (room = rmCombat) {
	nextRoom = noone;
	
	//ds_list_add(enemyList, AddEnemy(448, 128, "Drone", objDrone, ["beam"]));
	//ds_list_add(enemyList, AddEnemy(448, 288, "Drone", objDrone, ["rocket"]));
	ds_list_add(enemyList, AddEnemy(540, 160, "Enemy", objMech, ["beamsaber"]));
	CreatePlayer(87, 108, objManager.gameData.player);
	
	if !layer_sequence_exists("Instances",seqRivalAppears)
	{
		seqRivalAppears = layer_sequence_create("Instances", 320, 180, sqRivalAppears);
		layer_sequence_pause(seqRivalAppears);
	}
	
}