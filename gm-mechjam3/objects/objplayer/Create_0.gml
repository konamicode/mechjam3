// Inherit the parent event

frame = sprPlayer_idle_beamrifle;
frame = sprPlayer_attack_melee;

event_inherited();


quickshotTime = 0;

aiming = false;
aimCounter = 0;
canFire = true;

function GetAimDirection() {
	var dir = undefined;

	if input_source_using(INPUT_GAMEPAD) {
		dir = input_direction("aim_left", "aim_right", "aim_up", "aim_down");
	}

	if input_source_using( INPUT_KEYBOARD) {
		aim_x = input_cursor_x(0);
		aim_y = input_cursor_y(0);
		dir = point_direction(x, y, aim_x, aim_y);
	}
	
	return dir;
}