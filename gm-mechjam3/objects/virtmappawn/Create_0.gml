/// @description Initialize variables
mapX = 0;
mapY = 0;




function MoveLeft(mapInfo)
{
	if(mapX > 0)
	{
		if(mapInfo[mapY][mapX-1].isPresent)
		{
			if(mapInfo[mapY][mapX].isLiberated
				or mapInfo[mapY][mapX-1].isLiberated)
			{
				mapX = mapX - 1;
				//MoveToNewLocation();
			}
		}
	}
}

function MoveRight(mapInfo)
{
	if(mapX < array_length(mapInfo[mapY])-1)
	{
		if(mapInfo[mapY][mapX+1].isPresent)
		{
			if(mapInfo[mapY][mapX].isLiberated
				or mapInfo[mapY][mapX+1].isLiberated)
			{
				mapX = mapX + 1;
				//MoveToNewLocation();
			}
		}
	}
}

function MoveUp(mapInfo)
{
	if(mapY > 0)
	{
		if(mapInfo[mapY-1][mapX].isPresent and 
			(mapInfo[mapY][mapX].isLiberated or mapInfo[mapY-1][mapX].isLiberated))
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
					if(mapInfo[mapY-1][mapX+1].isPresent
						and mapInfo[mapY-1][mapX+1].isLiberated)
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
					if(mapInfo[mapY-1][mapX-1].isPresent
						and mapInfo[mapY-1][mapX-1].isLiberated)
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
		if(mapInfo[mapY+1][mapX].isPresent 
			and (mapInfo[mapY][mapX].isLiberated or mapInfo[mapY+1][mapX].isLiberated))
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
					if(mapInfo[mapY+1][mapX+1].isPresent
						and mapInfo[mapY+1][mapX+1].isLiberated)
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
					if(mapInfo[mapY+1][mapX-1].isPresent
						and mapInfo[mapY+1][mapX-1].isLiberated)
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

function MoveToNewLocation(_x, _y)
{
	var tileMap = objMapManager.tileMap;
	x = tileMap[_y][_x].x;
	y = tileMap[_y][_x].y;
	objMapManager.playerStartX = _x;
	objMapManager.playerStartY = _y;
}