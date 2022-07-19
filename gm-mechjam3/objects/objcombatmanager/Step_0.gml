
if (room == rmCombat)
{
	if layer_sequence_is_finished(seqRivalAppears) {
		layer_sequence_headpos(seqRivalAppears, 0);
		spawnedRival = GetRandomRival();
		ds_list_add(enemyList, SpawnRivalFromData(400, 160, spawnedRival));		
		layer_sequence_destroy(seqRivalAppears);
		var dialog = objManager.dialogData.GetDialog(spawnedRival.personality, enmContext.rivalArrives);
		show_debug_message(dialog);
		objMusicManager.RivalArrival();
	}
	
	//Check for level complete
	if (ds_list_size(enemyList) == 0) {
		if (spawnRival == true and spawnedRival == noone)
		{
			if(random(1) < rivalSpawnChance)
			{
				SetAlarm(2, 20);
			}			
		} 
		else
		{
			//You win!
			if (!changeRoom) {
				if (spawnRival == true and spawnedRival == noone)
				{
					LevelRival(spawnedRival);
				}
				EndCombat(true);
				changeRoom = true;
			}
		}
		
	} else if !instance_exists(objPlayer) {
		if (!changeRoom) {
			if (spawnRival == true and spawnedRival == noone)
			{
				LevelRival(spawnedRival);
			}
			EndCombat(false);	
			changeRoom = true; 
		}
	}

}