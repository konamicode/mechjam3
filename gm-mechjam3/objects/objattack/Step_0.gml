

if (canDamage) {

	// test for my collision type
	var _collider = noone;
	
	switch(attackType ) {
		case collision.image:
			_collider = ImageCollision(x, y, objMech);
		break;
		
		case collision.line: {

			if (aimed) {
				_componentCollision = BeamCollision(x, y, screenWidth, image_angle, objComponent);
	
				if ( _componentCollision != noone) { 
					if ( !_componentCollision.active ) 
						_componentCollision = noone;
						
					if (_componentCollision.creator == creator.id)
						_componentCollision = noone;
				} 
					
					
			}
			if (aimed) && (_componentCollision != noone) {
				_collider = _componentCollision;	
				//show_debug_message("hit component!");
			}
			if (aimed) && (_componentCollision == noone) {
				//if Aiming, test for a collision with an active component. Else, test for a mech

				_collider = BeamCollision(x, y,screenWidth, image_angle, objMech);
				//if (_collider == noone) 
				//	_collider = BeamCollision(x, y, lineWidth + i, image_angle, objMech);
			} else if ( _collider == noone)
			{
				_collider = BeamCollision(x, y,screenWidth, image_angle, objMech);
			}

		}
		break;
		
		case collision.box:
			_collider = BoxCollision(x, y, x - left, y - top, x + right, y + bottom, objMech);
		break;
	}
	
	if (_collider != noone) {

		CollisionEvent(_collider);
		//event_perform(ev_user0, 0);
		canDamage = false;
	}
	//if valid, do damage, and disable canDamage
	
}

if (attackType == collision.line) {
	image_alpha -= 0.02;

	if image_alpha < 0
		instance_destroy();
	
	lineWidth += 18;	
	
	lineWidth = clamp(lineWidth, 18, screenWidth);
}

