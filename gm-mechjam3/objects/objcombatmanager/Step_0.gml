
if (room == rmCombat)
{
	if layer_sequence_is_finished(seqRivalAppears) {
		layer_sequence_headpos(seqRivalAppears, 0);
		spawnedRival = GetRandomRival();
		ds_list_add(enemyList, SpawnRivalFromData(400, 160, spawnedRival));		
		layer_sequence_destroy(seqRivalAppears);
	}
	
	//Check for level complete
	if (ds_list_size(enemyList) == 0) {
		if (spawnRival == true and spawnedRival == noone)
		{
			if(random(1) < rivalSpawnChance)
			{
				//spawnedRival = ds_list_find_value(rivalList, ds_list_size(rivalList)-1);
				//moving to layer sequence complete
				//spawnedRival = GetRandomRival();
				//ds_list_add(enemyList, SpawnRivalFromData(400, 160, spawnedRival));
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
				EndCombat(true);
				changeRoom = true;
			}
		}
		
	} else if !instance_exists(objPlayer) {
		if (!changeRoom) {
			EndCombat(false);	
			changeRoom = true; 
		}
	}

}