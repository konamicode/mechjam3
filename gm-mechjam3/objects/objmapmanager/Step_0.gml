/// @description Insert description here
// You can write your code in this editor

//Debug functionality


if ( room == rmMap) {
	if(input_check_released("mapMenuConfirm"))
	{
			PlayerVictory();
	}

	if(input_check_released("cancel"))
	{
			PlayerFailure();
	}	
	
	if(input_check_released("accept"))
	{
		if(tileMap[playerPawn.mapY][playerPawn.mapX].isLiberated == false)
		{
			objCombatManager.StartCombat(tileMap[playerPawn.mapY][playerPawn.mapX].isFinalBattle);
		}
	}	
	
}
