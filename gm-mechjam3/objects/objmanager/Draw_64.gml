switch(room) {
	case rmMenu:
	break;
	case rmMap:
	//	if global.debug
			//draw_text(5, screenHeight - 20, "Rival Count: " + string(ds_map_size(objCombatManager.rivalMap)));
		
		var _align = draw_get_halign();
		draw_set_halign(fa_left);
		//draw_text(50, 15, "Player Stats:" + string(gameData.player.maxHp) + " Energy: " + string(gameData.player.maxStamina)
		//+ " Speed: " + string(gameData.player.moveSpeed) + " Ranged Attack: " + string(gameData.player.rngAttackPower)
		//+ " Melee Attack: " + string(gameData.player.meleeAttackPower));
		draw_text(50, screenHeight - 15, "Tile Reward: " + objMapManager.tileReward);
		draw_set_halign(fa_right);
		draw_text(screenWidth - 50, screenHeight - 30, "Strongest Rival " )
		draw_text( screenWidth - 50, screenHeight - 15, string( objCombatManager.strongestRival[1]) )
		draw_set_halign(_align);
	break;
}

//roomMenu.DrawMenu(room_width/4, 8);

if global.debug {
	draw_set_halign(fa_center);
	draw_text(screenWidth/2, screenHeight - 20, "Debug On");
}