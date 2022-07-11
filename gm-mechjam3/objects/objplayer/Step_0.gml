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
	    x += moveSpeed * _hor / _len;
	    y += moveSpeed * _ver / _len;
	}
	
	if input_check_pressed("aim") {
		aiming = true;
		//sprite_index = sprPlayer_idle_beamrifle;
	}
	if aiming && input_check_released("aim") {
		aiming = false;
		show_debug_message("released!")
	}
	
	if aiming {
		var _aimDir = GetAimDirection();
		if !is_undefined(_aimDir) {
			aimDir = _aimDir;
			lastDir = aimDir; 
		} else
			aimDir = lastDir;
	
	}		
	
	if input_check_pressed("shoot") && canFire {
		ChangeAnimation(sprPlayer_attack_beamrifle);
		canFire = false;
	}
}

