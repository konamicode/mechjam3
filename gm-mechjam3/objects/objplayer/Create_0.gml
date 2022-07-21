// Inherit the parent event


//frame = sprPlayer_attack_melee;

event_inherited();


quickshotTime = 0;

aiming = false;
aimCounter = 0;
canAttack = true;

subweaponIdx = 0;
fireSubwpn = false;
subweaponAmmo = 0;

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

//weapon = weapons[| 0];

function DoAttack() {
	var _sprite = GetAnimationName();
	if (weapon.animSet != "none") {
		ChangeAnimation(_sprite);
	} else {
		image_index = 0;
		var _x, _y;
		try {
			var _component = animationHitboxData[? weapon.position];
			var _frame = GetHitboxAnimFrame(animationHitboxData, sprite_index, image_index);
			var _frameData = _component[? _frame];
			_x = _frameData[1];
			_y = _frameData[2];
		}
		catch(_exception) {
			_x = 0;
			_y = 0;

		}
		
		FireWeapon(x + _x,  y + _y, weapon.attack, {image_angle:GetAimDirection(), aimed: aiming});
		
		switch(weaponName) {
			case "vulcans":
				instance_create_layer(x + _x, y + _y, "FX", objFX, {x_offsetStart: _x, y_offsetStart: _y, follow: true, creator: other.id, image_xscale: other.image_xscale, sprite_index: sprFX_attack_vulcans});
			break;
		}
	}	
}