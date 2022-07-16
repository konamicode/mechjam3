
switch(room) {
	case rmMenu:
		startMenu.DrawMenu(x, y);
	break;
		
}

roomMenu.DrawMenu(room_width/4, 8);

if global.debug
	draw_text(screenWidth/2, screenHeight - 20, "Debug On");