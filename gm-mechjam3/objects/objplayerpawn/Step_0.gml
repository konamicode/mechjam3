/// @description Insert description here
// You can write your code in this editor
if(input_check_released("left"))
{	
	UpdateLastLocation();
	MoveLeft(objMapManager.mapData);
}

if(input_check_released("right"))
{
	UpdateLastLocation();
	MoveRight(objMapManager.mapData);
}

if(input_check_released("up"))
{
	UpdateLastLocation();
	MoveUp(objMapManager.mapData);
}

if(input_check_released("down"))
{
	UpdateLastLocation();
	MoveDown(objMapManager.mapData);
}
