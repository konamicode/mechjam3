

var _down = keyboard_check_pressed(vk_down);
var _left = keyboard_check_pressed(vk_left);
var _right = keyboard_check_pressed(vk_right);
var _up = keyboard_check_pressed(vk_up);
var _enter = keyboard_check_pressed(vk_enter);
var _esc = keyboard_check_pressed(vk_escape);
var _backspace = keyboard_check_pressed(vk_backspace);

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

if (roomMenu)
{
	if _left	
		roomMenu.MenuUp();
			
	if _right
		roomMenu.MenuDown();
				
	if _backspace
		roomMenu.RunCallback(roomMenu.currentItem);
}