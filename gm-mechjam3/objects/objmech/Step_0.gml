event_inherited();

if (!isPlayer)
{

	var _dir = sign(objPlayer.x - x);
	if (_dir != 0)
		image_xscale = _dir;
		
}