if (room == rmMap) {
	UpdateStrongestRival();
}

if (room == rmCombat) {
	nextRoom = noone;
	ds_list_clear(enemyList);
	mpGrid = mp_grid_create(0, 0, room_width/30, room_height/30, 30, 30); 

	
	CreatePlayer(87, 108, objManager.gameData.player);
	
	if(isFinalBattle)
	{
		SetAlarm(2, 20);
	}
	else
	{
		var budget = objManager.gameData.player.buffLevel;
		enemyPool = undefined;
		enemyPool = ds_list_create();
		enemyPool = GetEnemiesForLevel();
		spawnList = ds_list_create();
		var manualSpawn = false;
		if (enemyPool != undefined) && (!manualSpawn) {
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
					_rx = irandom_range(floor(room_width*.1), floor(room_width*.9));
					_ry = irandom_range(floor(room_height*.1), floor(room_height*.9));
				} until (!place_meeting(_rx, _ry, objPlayer));
			
				ds_list_add(enemyList, AddEnemyFromCatalog(_rx, _ry, _enemyStruct)); 
			
			}
		}
		else {
			//ds_list_add(enemyList, AddEnemyFromData(448, 128, "Drone", objDrone, ["beamGun"]));
			//ds_list_add(enemyList, AddEnemyFromData(448, 288, "Drone", objDrone, ["bazooka"]));
			ds_list_add(enemyList, AddEnemyFromData(540, 160, "Mech", objMech, ["vulcans"]));
		}
	}

	if !layer_sequence_exists("Instances",seqRivalAppears)
	{
		if(isFinalBattle)
		{
			seqRivalAppears = layer_sequence_create("Instances", room_width/2, room_height/2, sqNemesisAppears);
			layer_sequence_play(seqRivalAppears);
		}
		else {
			seqRivalAppears = layer_sequence_create("Instances", room_width/2, room_height/2, sqRivalAppears);
			layer_sequence_pause(seqRivalAppears);
		}
	}
	
	if !layer_sequence_exists("GUI",seqRivalDialog)
	{
		seqRivalDialog = layer_sequence_create("GUI", room_width/2, room_height/2, sqRivalDialog);
		layer_sequence_pause(seqRivalDialog);
	}
	
	mp_grid_add_instances(mpGrid, objMech, true);
}