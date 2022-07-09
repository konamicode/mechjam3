//break out attack collision checks based on different types: melee/projectile, beam, explosion, etc.

var _collider = instance_place(x, y, objComponent);
if ( _collider != noone)
{ 
	if ( !_collider.active )
		_collider = noone;
}
else
{
	_collider = instance_place(x, y, objEnemy);	
}

var _attack = id;
if (_collider != noone)
{
	var _dmg = dmg;
	with (_collider)
	{
		if (object_index == objShield) && (active) {
			show_debug_message("Hit Shield!");
			with(_attack)
			{
				instance_destroy();
			}
			exit;
		}
		else
		if (object_index == objWeakpoint) {
			show_debug_message("Weakpoint Hit!");
		} else
		if (object_index == objEnemy) && actorState != states.hitstun {
			show_debug_message("Hit!");		
			Stun(_collider, stunType.light);
		}
		hp -= _dmg;
		with (_attack) {
			 instance_destroy();
		}
	}
}