/// @description Insert description here
// You can write your code in this editor
if(input_check_released("left"))
{	
	MoveLeft(global.mapManager.mapData);
}

if(input_check_released("right"))
{
	MoveRight(global.mapManager.mapData);
}

if(input_check_released("up"))
{
	MoveUp(global.mapManager.mapData);
}

if(input_check_released("down"))
{
	MoveDown(global.mapManager.mapData);
}
