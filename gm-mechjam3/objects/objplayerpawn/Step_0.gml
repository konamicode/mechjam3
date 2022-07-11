/// @description Insert description here
// You can write your code in this editor
if(input_check_released("left"))
{	
	UpdateLastLocation();
	MoveLeft(global.mapManager.mapData);
}

if(input_check_released("right"))
{
	UpdateLastLocation();
	MoveRight(global.mapManager.mapData);
}

if(input_check_released("up"))
{
	UpdateLastLocation();
	MoveUp(global.mapManager.mapData);
}

if(input_check_released("down"))
{
	UpdateLastLocation();
	MoveDown(global.mapManager.mapData);
}
