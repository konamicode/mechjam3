enemyList = ds_list_create();
nextRoom = noone;
changeRoom = false;
rivalMap = ds_map_create();
maxRivalCount = 5;
spawnRival = false;
spawnedRival = noone;
rivalSpawnChance = 1;
isFinalBattle = false;


seqRivalAppears = -1;
seqRivalDialog = -1;

strongestRival = [0, "None"]



rivalDialogComment = "";

function UpdateStrongestRival() {
	if ( ds_map_size(rivalMap) > 0 ) {
		var _rivalIdx = ds_map_find_first(rivalMap);
		var _r, _record;
		//var _record = ds_list_size(_r.battleRecord);
		//strongestRival[0] = _record;
		//strongestRival[1] = _r.name;
		repeat(ds_map_size(rivalMap))
		{
			_r = rivalMap[? _rivalIdx];
			_record = ds_list_size(_r.battleRecord);
			if _record > strongestRival[0] {
				strongestRival[0] = _record;
				strongestRival[1] = _r.name;
			}
			_rivalIdx = ds_map_find_next(rivalMap, _rivalIdx);
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
			global.missionStatus = enmMissionStatus.succeed;
		else
		{
			global.missionStatus = enmMissionStatus.incomplete;
			if(spawnedRival == noone)
			{
				for(i = 0; i < ds_list_size(enemyList); i++)
				{
					if(ds_list_find_value(enemyList, i).hasPilot == true)
					{
						if(AttemptToAddRival(ds_list_find_index(enemyList, 0), result))
						{
							//var rival = ds_list_find_value(rivalList, ds_list_size(rivalList)-1);
							var rival = ds_map_find_last(rivalMap);
							rivalDialogComment = objManager.dialogData.GetDialog(rival.personality, enmContext.rivalSpawnedPlayerDefeat);
							show_debug_message(rivalDialogComment);
						}
						break;
					}
				}
			}
		}
		if(spawnedRival != noone)
		{
			ds_list_add(ds_map_find_value(rivalMap, spawnedRival.name).battleRecord, result);
			spawnedRival = noone;
		}
		AttemptToSpawnFinalBattle();
		SetAlarm(0, room_speed * 3);
	}
	if(spawnedRival != noone)
	{
		ds_list_add(ds_map_find_value(rivalMap, spawnedRival.name).battleRecord, result);
		spawnedRival = noone;
	}
	SetAlarm(0, room_speed * 2);

}

function StartCombat(finalBattle) {

	isFinalBattle = finalBattle;
	if(ds_map_size(rivalMap) > 0)
	{
		if(random(1) <= rivalSpawnChance)
		{
			spawnRival = true;
		}
	}
	SetAlarm(1, 20);

}

function AttemptToAddRival(mech, result)
{
	//Roll to see if we want to promote the unit to a rival
	var odds = 1 - (ds_map_size(rivalMap)/maxRivalCount);
	if(random(1) < odds)
	{
		var rival = GenerateRivalData(mech, result)
		ds_map_add(rivalMap, rival.name, rival);
		return rival.name;
	}
	return noone;
}


function GetRandomRival() {
	var _array = ds_map_keys_to_array(objCombatManager.rivalMap);
	var _key = _array[irandom(array_length(_array) - 1)];
	show_debug_message("Selecting Rival: " + string(_key));
	return objCombatManager.rivalMap[? _key];
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
