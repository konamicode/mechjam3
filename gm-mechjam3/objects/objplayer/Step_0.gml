if (actorState == state.dead) {
	
	
	
	
} else {
	
	
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
	
	if input_check_pressed("shoot") {
		
	}
}

