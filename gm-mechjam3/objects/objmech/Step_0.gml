event_inherited();

if (actorState == state.dead) {
	if (!isPlayer)
	{
		if(hasPilot) {
			if (name == "")
			{
				var rivalName = objCombatManager.AttemptToAddRival(self, true);
				if( rivalName != noone)
				{
					//var rival = ds_list_find_value(objCombatManager.rivalList, ds_list_size(objCombatManager.rivalList)-1);
					var rival = objCombatManager.rivalMap[? rivalName];
					objCombatManager.currentRivalName = rivalName;
					objCombatManager.rivalDialogComment = objManager.dialogData.GetDialog(rival.personality, enmContext.rivalSpawnedPlayerVictory);
					with (objCombatManager)
					{
						PlayDialogSeq();
					}
				}
			} else
			{
				var rival = objCombatManager.rivalMap[? name];
				objCombatManager.currentRivalName = name;				
				objCombatManager.rivalDialogComment = objManager.dialogData.GetDialog(rival.personality, enmContext.playerBeatsRival);
				with (objCombatManager)
				{
					PlayDialogSeq();	
				}
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
					aimDir = GetTargetDirection(objPlayer);
					if (ammoCounter > 0) {
						action = "attack";
						alarm[1] = weapon.burstRate * room_speed;
						canAttack = false;
						ammoCounter -= 1;

						var _sprite = GetAnimationName();
						if (weapon.animSet != "none") {
							ChangeAnimation(_sprite);
						} else {
							image_index = 0;
							var _x, _y;
							try {
								var _component = animationHitboxData[? weapon.position];
								var _frame = GetHitboxAnimFrame(animationHitboxData, sprite_index, image_index);
								var _frameData = _component[? _frame];
								_x = _frameData[1];
								_y = _frameData[2];
							}
							catch(_exception) {
								_x = 0;
								_y = 0;

							}
							//fire vulcans?
							
							FireWeapon(x + _x,  y + _y, weapon.attack, {image_angle:GetTargetDirection(objPlayer), aimed: aiming});
						}
					}
		
					if( ammoCounter == 0) {
						canAttack = false;
						alarm[1] = (weapon.fireRate - weapon.burstRate) * room_speed;
						ammoCounter = weapon.clipSize;
						DeductStamina(weapon.cost);
					}
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