
if (room == rmCombat)
{
	if (ds_list_size(enemyList) == 0) {
		if (spawnRival)	
		{
			//Add a rival!
			ds_list_add(enemyList, AddEnemy(400, 160));
			spawnRival = false;
			
		} else
		{
			//You win!	
			show_debug_message("You win!");
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