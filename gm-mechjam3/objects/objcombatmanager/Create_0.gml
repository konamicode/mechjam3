enemyList = ds_list_create();
nextRoom = noone;
changeRoom = false;
objManager.gameData.rivals = ds_map_create();
maxRivalCount = 5;
spawnRival = false;
spawnedRival = noone;
rivalSpawnChance = .67;
isFinalBattle = false;
mpGrid = noone;

seqRivalAppears = -1;
seqRivalDialog = -1;

strongestRival = [0, "None"]

currentRivalName = "";
rivalDialogComment = "";

function UpdateStrongestRival() {
	if ( ds_map_size(objManager.gameData.rivals) > 0 ) {
		var _rivalIdx = ds_map_find_first(objManager.gameData.rivals);
		var _r, _record;
		//var _record = ds_list_size(_r.battleRecord);
		//strongestRival[0] = _record;
		//strongestRival[1] = _r.name;
		repeat(ds_map_size(objManager.gameData.rivals))
		{
			_r = objManager.gameData.rivals[? _rivalIdx];
			_record = ds_list_size(_r.battleRecord);
			if _record > strongestRival[0] {
				strongestRival[0] = _record;
				strongestRival[1] = _r.name;
			}
			_rivalIdx = ds_map_find_next(objManager.gameData.rivals, _rivalIdx);
		}
	}
}

function RemoveEnemy(_id) {
	var _index = ds_list_find_index(enemyList, _id);
	if (_index != -1 )  {
		ds_list_delete(enemyList, _index);
	}
}

function EndCombat(result) {
	if(isFinalBattle)
	{
		objEndGameManager.playerWon = result;
		objEndGameManager.rivalName = spawnedRival.name;
		room_goto(rmGameEnd);
		objEndGameManager.isActive = true;
	}
	else
	{
		if (result)
		{
			global.missionStatus = enmMissionStatus.succeed;
			AttemptToSpawnFinalBattle();
		}
		else
		{
			global.missionStatus = enmMissionStatus.incomplete;
			if(spawnedRival == noone)
			{
				for(i = 0; i < ds_list_size(enemyList); i++)
				{
					var curUnit = ds_list_find_value(enemyList, i);
					if(instance_exists(curUnit) and curUnit.hasPilot == true)
					{
						currentRivalName = AttemptToAddRival(curUnit, result);
						if(currentRivalName != noone)
						{
							rivalDialogComment = objManager.dialogData.GetDialog(ds_map_find_value(objManager.gameData.rivals, currentRivalName).personality, enmContext.rivalSpawnedPlayerDefeat);
							PlayDialogSeq();
							break;
						}
						break;
					}
				}
			} 
			if(spawnedRival != noone)
			{
				ds_list_add(ds_map_find_value(objManager.gameData.rivals, spawnedRival.name).battleRecord, result);
				rivalDialogComment = objManager.dialogData.GetDialog(ds_map_find_value(objManager.gameData.rivals, currentRivalName).personality, enmContext.rivalSpawnedPlayerDefeat);
				PlayDialogSeq();
				spawnedRival = noone;
			}			
		}

		//SetAlarm(0, room_speed * 3);
	}
	if(spawnedRival != noone)
	{
		ds_list_add(ds_map_find_value(objManager.gameData.rivals, spawnedRival.name).battleRecord, result);
		spawnedRival = noone;
	}
	SetAlarm(0, room_speed * 2);

}

function StartCombat(finalBattle) {

	isFinalBattle = finalBattle;
	if(ds_map_size(objManager.gameData.rivals) > 0)
	{
		if(random(1) <= rivalSpawnChance)
		{
			spawnRival = true;
		} else
			spawnRival = false;
	}
	SetAlarm(1, 20);


}

function AttemptToAddRival(mech, result)
{
	//Roll to see if we want to promote the unit to a rival
	var odds = 1 - (ds_map_size(objManager.gameData.rivals)/maxRivalCount);
	if(random(1) < odds)
	{
		var rival = GenerateRivalData(mech, result);
		ds_map_add(objManager.gameData.rivals, rival.name, rival);
		return rival.name;
	}
	return noone;
}


function GetRandomRival() {
	var _array = ds_map_keys_to_array(objManager.gameData.rivals);
	var _key = _array[irandom(array_length(_array) - 1)];
	show_debug_message("Selecting Rival: " + string(_key));
	return objManager.gameData.rivals[? _key];
}

weaponMap = ds_map_create();
weaponMap = LoadWeapons("weapons.json");

function LoadEnemyCatalog() {
	var enemyList = ds_list_create();
	var catalogFile = file_text_open_read("enemyCatalogue.json");

	var jsonStr = "";
	while(!file_text_eof(catalogFile))
	{
		jsonStr += file_text_read_string(catalogFile);
		file_text_readln(catalogFile);
	}
	file_text_close(catalogFile);
	var enemyData = json_parse(jsonStr);
	if ( array_length(enemyData) > 0) {
		for (var i = 0; i < array_length(enemyData); i++) {
			ds_list_add(enemyList, enemyData[i]);
		}
		return enemyList;
	}
	else
		ds_list_destroy(enemyList);
		return undefined;

}

enemyCatalog = ds_list_create();
enemyCatalog = LoadEnemyCatalog();

function GetEnemiesForLevel() {
	var _enemyPool = ds_list_create();
	var _catalogSize = ds_list_size(enemyCatalog);
	for (var i = 0; i < _catalogSize; i++) {
		var _minLevel = enemyCatalog[| i].minLevel;
		var _maxLevel = enemyCatalog[| i].maxLevel;
		if(between(objManager.gameData.player.buffLevel, _minLevel, _maxLevel, true))
		{
			ds_list_add(_enemyPool, enemyCatalog[| i]);
		}
	}
	if ( ds_list_size(_enemyPool) > 0)
		return _enemyPool;
	else
		ds_list_destroy(_enemyPool);
		return undefined;
}

function PlayDialogSeq()
{
	layer_sequence_play(seqRivalDialog);
}
