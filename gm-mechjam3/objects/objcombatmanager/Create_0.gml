enemyList = ds_list_create();
spawnRival = false;
nextRoom = noone;
changeRoom = false;
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
		global.missionStatus = enmMissionStatus.incomplete;
	SetAlarm(0, 90);

}

function StartCombat() {
	
	SetAlarm(1, 20);

}