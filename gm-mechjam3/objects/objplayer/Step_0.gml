if (actorState == state.dead) {
	
	
	
	
} else {
	
	var _left = input_check("left");
	var _right = input_check("right");
	var _up = input_check("up");
	var _down = input_check("down");

	var _hor = _right - _left;
	var _ver = _down - _up;
	
	var _hor = _right - _left;
	var _ver = _down - _up;
	var _len = point_distance(0, 0, _hor, _ver);
	if (_len > 0) {
		if((_hor > 0 and x < room_width) or (_hor < 0 and x > 0))
		{
			x += moveSpeed * _hor / _len;
		}
		if((_ver > 0 and y < room_height) or (_ver < 0 and y > 0))
		{
			y += moveSpeed * _ver / _len;
		}
	}
	
	if input_check_pressed("aim") {
		aiming = true;
		//sprite_index = sprPlayer_idle_beamrifle;
		weapon = weapons[| GetWeaponByName("beamRifle",weapons)];
		weaponName = weapon.label;
		ChangeAnimation(GetAnimationName());
		
	}
	if aiming && input_check_released("aim") {
		aiming = false;
		show_debug_message("released!")
	}
	
	//if aiming {
	//	var _aimDir = GetAimDirection();
	//	if !is_undefined(_aimDir) {
	//		aimDir = _aimDir;
	//		lastDir = aimDir; 
	//	} else
	//		aimDir = lastDir;
	//} else 
	//	aimDir = point_direction(0, 0, image_xscale, 0);	
	
	var _aimDir = GetAimDirection();
	if !is_undefined(_aimDir) {
		aimDir = _aimDir;
		lastDir = aimDir; 
	} else
		aimDir = lastDir;
		
	if (aimDir > 90) && ( aimDir < 270) {
		image_xscale = -1;	
	} else
		image_xscale = 1;
	
	
	if (input_check("shoot") && weaponName != "beamRifle") {
		weapon = weapons[| GetWeaponByName("beamRifle",weapons)];
		weaponName = weapon.label;	
		ChangeAnimation(GetAnimationName());
	}
	
	if input_check("shoot") && canAttack  {
		if (ammoCounter > 0) {
			action = "attack";
			alarm[1] = weapon.burstRate * room_speed;
			canAttack = false;
			ammoCounter -= 1;
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
			}
		}
		
		if( ammoCounter == 0) {
			canAttack = false;
			alarm[1] = (weapon.fireRate - weapon.burstRate) * room_speed;
			ammoCounter = weapon.clipSize;
			DeductStamina(weapon.cost);
		}
		
	}
	
	
	
	if input_check_pressed("action") {
		action = "attack";
		var idx = GetWeaponByName("beamSaber", weapons)
		if (idx > 0) {
			weapon = weapons[| idx];
			weaponName = weapon.label;
			ChangeAnimation(GetAnimationName());
		}
	}
}

