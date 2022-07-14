enemyList = ds_list_create();
spawnRival = false;
nextRoom = noone;
changeRoom = false;
rivalList = ds_list_create();
maxRivalCount = 10;


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
		AttemptToAddRival(ds_list_find_index(enemyList, 0), result);
		global.missionStatus = enmMissionStatus.incomplete;
	}
	SetAlarm(0, 90);

}

function StartCombat() {
	
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