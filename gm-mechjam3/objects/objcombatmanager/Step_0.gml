
if (room == rmCombat)
{
	if layer_sequence_is_finished(seqRivalAppears) {
		layer_sequence_headpos(seqRivalAppears, 0);
		spawnedRival = GetRandomRival();
		layer_sequence_destroy(seqRivalAppears);
		ds_list_add(enemyList, SpawnRivalFromData(400, 160, spawnedRival));
		rivalDialogComment = objManager.dialogData.GetDialog(spawnedRival.personality, enmContext.rivalArrives);
		show_debug_message(rivalDialogComment);
		objMusicManager.RivalArrival();
		PlayDialogSeq();
	}
	
	if layer_sequence_is_finished(seqRivalDialog) {
		layer_sequence_headpos(seqRivalDialog, 0);
		rivalDialogComment = "";
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