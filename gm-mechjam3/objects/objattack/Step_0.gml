
if (attackType == collision.line) {
	image_alpha -= 0.02;

	if image_alpha < 0
		instance_destroy();
	
	lineWidth += 18;	
}

lineWidth = clamp(lineWidth, 18, screenWidth);
if (canDamage) {

	// test for my collision type
	var _collider = noone;
	
	switch(attackType ) {
		case collision.image:
		
		break;
		
		case collision.line: {
			for (var i = 0; i < 18; i++) {
				_collider = BeamCollision(x, y, lineWidth + i, image_angle, objMech);
			}
		}
		break;
		
		case collision.box:
		
		break;
	}
	
	if (_collider != noone) {
		show_debug_message("hit!");
		DoDamage(_collider, dmg);
		canDamage = false;
	}
	//if valid, do damage, and disable canDamage
	
}