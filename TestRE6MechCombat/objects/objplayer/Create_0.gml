// Inherit the parent event
event_inherited();

aiming = false;
aimCounter = 0;

quickshotTime = 20;

energyRechargeRate = 0.2;
canRecharge = true;

aimDir = 0;
lastDir = aimDir;

aim_x = 0;
aim_y = 0;

function GetAimDirection() {
	var dir = undefined;
	var _inputSource = input_player_source_get(0);
	if (_inputSource == INPUT_SOURCE.GAMEPAD) {
		dir = input_direction("aim_left", "aim_right", "aim_up", "aim_down");
	}

	if (_inputSource == INPUT_SOURCE.KEYBOARD_AND_MOUSE) {
		aim_x = mouse_x;
		aim_y = mouse_y;
		dir = point_direction(x, y, mouse_x, mouse_y);
	}
	
	return dir;
}

meleeCollider = noone;