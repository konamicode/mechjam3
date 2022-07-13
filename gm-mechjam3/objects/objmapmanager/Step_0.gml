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
		objCombatManager.StartCombat();	
	
	
	}	
	
}
