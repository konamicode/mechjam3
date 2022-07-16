enemyList = ds_list_create();
nextRoom = noone;
changeRoom = false;
rivalList = ds_list_create();
maxRivalCount = 10;
spawnRival = false;
spawnedRival = noone;
rivalSpawnChance = 1;


seqRivalAppears = noone;


function RemoveEnemy(_id) {
	var _index = ds_list_find_index(enemyList, _id);
	if (_index != -1 )  {
		ds_list_delete(enemyList, _index);
	}
}

function EndCombat(result) {
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
					AttemptToAddRival(ds_list_find_index(enemyList, 0), result);
					break;
				}
			}
		}
	}
	if(spawnedRival != noone)
	{
		ds_list_add(ds_list_find_value(rivalList, spawnedRival).battleRecord, result);
	}
	SetAlarm(0, 90);

}

function StartCombat() {
	
	if(ds_list_size(rivalList) > 0)
	{
		if(random(1) < rivalSpawnChance)
		{
			spawnRival = true;
		}
	}
	SetAlarm(1, 20);

}

function AttemptToAddRival(mech, result)
{
	//Roll to see if we want to promote the unit to a rival
	var odds = 1 - (ds_list_size(rivalList)/maxRivalCount);
	if(random(1) < odds)
	{
		ds_list_add(rivalList, GenerateRivalData(mech, result));
	}
}

BuildWeapons();