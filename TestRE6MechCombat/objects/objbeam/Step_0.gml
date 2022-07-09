image_alpha -= 0.02;
//width = shotParent.x - x;
width += 18;


if image_alpha < 0
	instance_destroy();
	

for (var i = 0; i < 18; i++) {
	var _collider = collision_line(x, y, x + lengthdir_x(width + i, image_angle), y +  + lengthdir_y(width + i, image_angle), objComponent, true, true);
	if ( _collider != noone)
	{ 
		if ( !_collider.active )
			_collider = noone;
	}
	if (_collider == noone) {
		_collider = collision_line(x, y, x + lengthdir_x(width, image_angle), y +  + lengthdir_y(width, image_angle), objEnemy, true, true);
	}	
}
var beam = id;
if (_collider != noone)
{
	var _dmg = dmg;
	with (_collider)
	{
		if (object_index == objShield) && (active) {
			show_debug_message("Hit Shield!");
			with(beam)
			{
				instance_destroy();
			}
			//exit;
		}
		else
		if (object_index == objWeakpoint) {
			show_debug_message("Weakpoint Hit!");
			hp -= _dmg;
		} else
		if (object_index == objEnemy) && actorState != states.hitstun {
			show_debug_message("Hit!");		
			Stun(_collider, stunType.light);
			hp -= _dmg;
		}
	}
}
