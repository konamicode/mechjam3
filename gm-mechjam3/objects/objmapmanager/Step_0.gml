/// @description Insert description here
// You can write your code in this editor

//Debug functionality
if(input_check_released("mapMenuConfirm"))
{
	if(room == rmMap)
		PlayerVictory();
}

if(input_check_released("cancel"))
{
	if(room == rmMap)
		PlayerFailure();
}