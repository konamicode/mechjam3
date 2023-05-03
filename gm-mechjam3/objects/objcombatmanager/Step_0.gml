
if (room == rmCombat)
{
	if layer_sequence_is_finished(seqRivalAppears) {
		layer_sequence_headpos(seqRivalAppears, 0);
		var dialogContext = enmContext.rivalArrives;
		if(isFinalBattle)
		{

			spawnedRival = objManager.gameData.rivals[? strongestRival[1]];
			dialogContext = enmContext.startFinalBattle;
		}
		else
		{
			spawnedRival = GetRandomRival();
		}
		layer_sequence_destroy(seqRivalAppears);
		var _rx;
		var _ry;
		do {
			_rx = irandom_range(floor(room_width*.1), floor(room_width*.9));
			_ry = irandom_range(floor(room_height*.1), floor(room_height*.9));
		} until (!collision_circle(_rx, _ry, 300, objPlayer, false, false));		
		ds_list_add(enemyList, SpawnRivalFromData(_rx, _ry, spawnedRival));
		currentRivalName = spawnedRival.name;
		rivalDialogComment = objManager.dialogData.GetDialog(spawnedRival.personality, dialogContext);
		objMusicManager.RivalArrival();
		PlayDialogSeq();
	}
	
	if layer_sequence_is_finished(seqRivalDialog) {
		layer_sequence_headpos(seqRivalDialog, 0);
	} else
	{
		show_debug_message(layer_sequence_get_headpos(seqRivalDialog));
	}
	
	//Check for level complete
	if (ds_list_size(enemyList) == 0)  {
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
				if (spawnRival == true and spawnedRival != noone)
				{
					LevelRival(spawnedRival);
				}
				if (spawnedRival)
				{
					if layer_sequence_is_finished(seqRivalDialog)
					{
						EndCombat(true);
						changeRoom = true;
					}
				} else
				{
					EndCombat(true);
					changeRoom = true;
				}
			}
				
		}	
	} else if !instance_exists(objPlayer) && layer_sequence_is_finished(seqRivalDialog) {
		if (!changeRoom) {
			if (spawnRival == true and spawnedRival != noone)
			{
				LevelRival(spawnedRival);
			}
			if (spawnedRival)
			{
				if layer_sequence_is_finished(seqRivalDialog)
				{
					EndCombat(false);
					changeRoom = true;
				}
			} else
			{
				EndCombat(false);
				changeRoom = true;
			}
		}
	} 
	else
	{
		SetAlarm(3, 3 * room_speed);	
	}
}