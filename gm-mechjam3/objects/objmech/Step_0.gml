event_inherited();

if (actorState == state.dead) {
	instance_destroy();
	if (!isPlayer)
	{
		if(hasPilot == true)
		{
			objCombatManager.AttemptToAddRival(self, true);
		}
		objCombatManager.RemoveEnemy(id);
	}
	exit;
}

if (!isPlayer)
{

	var _dir = sign(objPlayer.x - x);
	if (_dir != 0)
		image_xscale = _dir;
		
}