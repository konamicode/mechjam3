/// @description Initialize variables
mapX = 0;
mapY = 0;

function MoveLeft(mapInfo)
{
	if(mapX > 0)
	{
		if(mapInfo[mapY][mapX-1].isPresent)
		{
			mapX = mapX - 1;
			MoveToNewLocation();
		}
	}
}

function MoveRight(mapInfo)
{
	if(mapX < array_length(mapInfo[mapY])-1)
	{
		if(mapInfo[mapY][mapX+1].isPresent)
		{
			mapX = mapX + 1;
			MoveToNewLocation();
		}
	}
}

function MoveUp(mapInfo)
{
	if(mapY > 0)
	{
		if(mapInfo[mapY-1][mapX].isPresent)
		{
			mapY = mapY - 1;
			MoveToNewLocation();
		}
	}
}

function MoveDown(mapInfo)
{
	if(mapY < array_length(mapInfo)-1)
	{
		if(mapInfo[mapY+1][mapX].isPresent)
		{
			mapY = mapY + 1;
			MoveToNewLocation();
		}
	}
}

function MoveToNewLocation()
{
	var tileMap = global.mapManager.tileMap;
	x = tileMap[mapY][mapX].x;
	y = tileMap[mapY][mapX].y;
}