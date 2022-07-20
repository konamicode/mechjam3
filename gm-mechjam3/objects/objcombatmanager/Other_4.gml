if (room == rmMap) {
	UpdateStrongestRival();
}

if (room == rmCombat) {
	nextRoom = noone;
	
	CreatePlayer(87, 108, objManager.gameData.player);
	
	var budget = objManager.gameData.player.buffLevel;
	enemyPool = undefined;
	enemyPool = ds_list_create();
	enemyPool = GetEnemiesForLevel();
	spawnList = ds_list_create();
	if (enemyPool != undefined) {
		while (budget >= 0) {
				//add enemies to spawn list	
				_enemy = enemyPool[| irandom(ds_list_size(enemyPool) - 1)];
				ds_list_add(spawnList, _enemy);
				budget -= _enemy.cost;
			}
	
		for (var i = 0; i < ds_list_size(spawnList); i++) {
			var _enemyStruct = spawnList[| i];
			var _rx, _ry;
			do {
				_rx = random(screenWidth);
				_ry = random(screenHeight);
			} until (!place_meeting(_rx, _ry, objPlayer));
			
			ds_list_add(enemyList, AddEnemyFromCatalog(_rx, _ry, _enemyStruct)); 
			
		}
	}
	else {
		ds_list_add(enemyList, AddEnemyFromData(448, 128, "Drone", objDrone, ["beamGun"]));
		ds_list_add(enemyList, AddEnemyFromData(448, 288, "Drone", objDrone, ["bazooka"]));
		ds_list_add(enemyList, AddEnemyFromData(540, 160, "Enemy", objMech, ["beamSaber"]));
	}

	
	if !layer_sequence_exists("Instances",seqRivalAppears)
	{
		seqRivalAppears = layer_sequence_create("Instances", 320, 180, sqRivalAppears);
		layer_sequence_pause(seqRivalAppears);
	}
	
}