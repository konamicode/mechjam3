

var _down = keyboard_check_pressed(vk_down);
var _up = keyboard_check_pressed(vk_up);
var _enter = keyboard_check_pressed(vk_enter);
var _esc = keyboard_check_pressed(vk_escape);

switch(room) {
	case rmMenu:
		if _down	
			startMenu.MenuDown();
	
		if _up
			startMenu.MenuUp();
	
		if _enter
			startMenu.RunCallback(startMenu.currentItem);
	break;	
	
	
}