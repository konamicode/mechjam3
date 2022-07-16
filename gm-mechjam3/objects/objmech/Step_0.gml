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
		
	if between(DistanceToTarget(objPlayer), weapon.range.minDist, weapon.range.maxDist){
		action = "attack";
	}
	else
	{
		action = "idle";
		MoveWithinRange(weapon.range.minDist, objPlayer);
	}
	
		
	if (weapon == "placeholder") {
		show_debug_message("WtF");	
	}
}