switch(room) {
	case rmMenu:
	break;
	case rmMap:
		if global.debug
			draw_text(5, screenHeight - 20, "Rival Count: " + string(ds_map_size(objCombatManager.rivalMap)));
			draw_text(screenWidth - 100, screenHeight - 30, "Strongest Rival " )
			draw_text( screenWidth - 100, screenHeight - 15, string( objCombatManager.strongestRival[1]) + ": " + string(objCombatManager.strongestRival[0]) )
	break;
}

//roomMenu.DrawMenu(room_width/4, 8);

if global.debug {
	draw_set_halign(fa_center);
	draw_text(screenWidth/2, screenHeight - 20, "Debug On");
}