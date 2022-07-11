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
		//In the case that the logical up isn't present, attempt to travel to the alternate intuitive up
		else
		{
			if(mapY mod 2 == 0)
			{
				if(mapX < array_length(mapInfo[mapY])-1)
				{
					if(mapInfo[mapY-1][mapX+1].isPresent)
					{
						mapY = mapY - 1;
						mapX = mapX + 1;
						MoveToNewLocation();
					}
				}
			}
			else
			{
				if(mapX > 0)
				{
					if(mapInfo[mapY-1][mapX-1].isPresent)
					{
						mapY = mapY - 1;
						mapX = mapX - 1;
						MoveToNewLocation();
					}
				}
			}
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
		//In the case that the logical down isn't present, attempt to travel to the alternate intuitive down
		else
		{
			if(mapY mod 2 == 0)
			{
				if(mapX < array_length(mapInfo[mapY])-1)
				{
					if(mapInfo[mapY+1][mapX+1].isPresent)
					{
						mapY = mapY + 1;
						mapX = mapX + 1;
						MoveToNewLocation();
					}
				}
			}
			else
			{
				if(mapX > 0)
				{
					if(mapInfo[mapY+1][mapX-1].isPresent)
					{
						mapY = mapY + 1;
						mapX = mapX - 1;
						MoveToNewLocation();
					}
				}
			}
		}
	}
}

function MoveToNewLocation()
{
	var tileMap = global.mapManager.tileMap;
	x = tileMap[mapY][mapX].x;
	y = tileMap[mapY][mapX].y;
}