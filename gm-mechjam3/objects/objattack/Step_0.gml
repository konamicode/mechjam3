
if (canDamage) {

	// test for my collision type
	var _collider = noone;
	
	switch(collisionType ) {
		case collision.image:
		
		break;
		
		case collision.line:
		
		
		break;
		
		case collision.box:
		
		break;
	}
	
	if (_collider != noone) {
		DoDamage(_collider, dmg);
		canDamage = false;
	}
	//if valid, do damage, and disable canDamage
	
}