event_inherited();

if (actorState == state.dead) {
	if (!isPlayer)
	{
		if(hasPilot == true and name == noone)
		{
			objCombatManager.AttemptToAddRival(self, true);
		}
		objCombatManager.RemoveEnemy(id);
	}
	instance_destroy();
	exit;
}

if (!isPlayer)
{

	var _dir = sign(objPlayer.x - x);
	if (_dir != 0)
		image_xscale = _dir;
		
}