
if (room == rmCombat)
{
	if layer_sequence_is_finished(seqRivalAppears) {
		layer_sequence_headpos(seqRivalAppears, 0);
		spawnedRival = GetRandomRival();
		ds_list_add(enemyList, SpawnRivalFromData(400, 160, spawnedRival));		
		layer_sequence_destroy(seqRivalAppears);
		var dialog = objManager.dialogData.GetDialog(spawnedRival.personality, 3);
		show_debug_message(dialog);
	}
	
	//Check for level complete
	if (ds_list_size(enemyList) == 0) {
		if (spawnRival == true and spawnedRival == noone)
		{
			if(random(1) < rivalSpawnChance)
			{
				var _finished = layer_sequence_is_finished(seqRivalAppears);
				var _paused = layer_sequence_is_paused(seqRivalAppears);
				if !_finished && _paused
					layer_sequence_play(seqRivalAppears);

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