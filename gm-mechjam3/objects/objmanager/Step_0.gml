

var _down = input_check_pressed("down");
var _left = input_check_pressed("left");
var _right = input_check_pressed("right");
var _up = input_check_pressed("up");
var _accept = input_check_pressed("accept");
var _esc = input_check_pressed("cancel");
var _backspace = input_check_pressed("mapMenuConfirm");

switch(room) {
	case rmMenu:
		if _down	
			startMenu.MenuDown();
	
		if _up
			startMenu.MenuUp();
	
		if _accept
			startMenu.RunCallback(startMenu.currentItem);
	break;	
	
}

if (roomMenu)
{
	if keyboard_check_pressed(ord("1"))
		GoToMapRoom()
		
	if keyboard_check_pressed(ord("2"))
		GoToCombatRoom();
		
	if keyboard_check_pressed(ord("3"))
		GoToStartRoom();
}

if keyboard_check_pressed(vk_f2)
	global.debug = !global.debug;