event_inherited();

if (actorState == state.dead) {
	if (!isPlayer)
	{
		if(hasPilot == true and name == noone)
		{
			var rivalName = objCombatManager.AttemptToAddRival(self, true);
			if( rivalName != noone)
			{
				//var rival = ds_list_find_value(objCombatManager.rivalList, ds_list_size(objCombatManager.rivalList)-1);
				var rival = objCombatManager.rivalMap[? rivalName];
				var rivalComment = objManager.dialogData.GetDialog(rival.personality, enmContext.rivalSpawnedPlayerVictory);
				show_debug_message(rivalComment);
			}
		}
		objCombatManager.RemoveEnemy(id);
	}
	instance_destroy();
	
}
else {
	if (!isPlayer)
	{
		switch (actorState) {
		case state.stun:
		break;
		default: 
			var _dir = sign(objPlayer.x - x);
			if (_dir != 0)
				image_xscale = _dir;
		
			if between(DistanceToTarget(objPlayer), weapon.range.minDist, weapon.range.maxDist){
				if (canAttack) {
					action = "attack";
					alarm[1] = weapon.fireRate * room_speed;
					canAttack = false;
					ChangeAnimation(GetAnimationName());
				}
			}
			else
			{
				action = "idle";
				//SelectWeapon();
				MoveWithinRange(weapon.range.minDist, objPlayer);
			}
		break;
		}
	}
}