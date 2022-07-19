/// @description Insert description here
// You can write your code in this editor
if(input_check_released("left"))
{	
	UpdateLastLocation();
	//MoveLeft(objMapManager.mapData);
	dirIdx += 1;
	if dirIdx > array_length(directions) - 1
		dirIdx = 0;
	
	facingDirection = directions[dirIdx];
}

if(input_check_released("right"))
{
	UpdateLastLocation();
	//MoveRight(objMapManager.mapData);


	if dirIdx == 0
		dirIdx = array_length(directions) - 1;
	else
		dirIdx -= 1;

facingDirection = directions[dirIdx];

}

if(input_check_released("up"))
{
	UpdateLastLocation();
	//MoveUp(objMapManager.mapData);
	
	//MoveTowards
	
	switch(facingDirection) {
		case 0:
			//move right ( x + 1)
			MoveRight(objMapManager.mapData);
			MoveToNewLocation(mapX, mapY);
		break;
		case 120:
			mapX -= 0.5;
			if(mapY > 0) 
			{			
				if(objMapManager.mapData[mapY-1][floor(mapX)].isPresent and 
					(objMapManager.mapData[mapY][mapX].isLiberated or objMapManager.mapData[mapY-1][floor(mapX)].isLiberated))
				{	
					
					mapY = mapY - 1;
					
				}				
			}
			MoveToNewLocation(floor(mapX), mapY);
		break;
		case 60:
			mapX += 0.5;
			if(mapY > 0)
			{			
				if(objMapManager.mapData[mapY-1][mapX].isPresent and 
					(objMapManager.mapData[mapY][mapX].isLiberated or objMapManager.mapData[mapY-1][mapX].isLiberated))
				{
						
					mapY = mapY - 1;					
				}
				
			}
			MoveToNewLocation(floor(mapX), mapY);
		break;
		case 180:
			MoveLeft(objMapManager.mapData);
			MoveToNewLocation(mapX, mapY);			
		break;
		case 300:
 			mapX += 0.5;
			if (mapY < array_length(objMapManager.mapData[mapY])-1) 
			{
				if(objMapManager.mapData[mapY + 1][mapX].isPresent)
				{
					if(objMapManager.mapData[mapY][mapX].isLiberated
						or objMapManager.mapData[mapY + 1][mapX].isLiberated)
					{
						//MoveRight(objMapManager.mapData);
						//mapX += 1;
						mapY = mapY + 1;
					}
				}
			}	
			MoveToNewLocation(floor(mapX), mapY);
		break;
		case 240:
			mapX -= 0.5;	
			if(mapY < array_length(objMapManager.mapData[mapY])-1)
			{
				if(objMapManager.mapData[mapY + 1][mapX].isPresent)
				{
					if(objMapManager.mapData[mapY][mapX].isLiberated
						or objMapManager.mapData[mapY + 1][mapX].isLiberated)
					{
						mapY = mapY + 1;						
					}
				}
			}		
			MoveToNewLocation(floor(mapX), mapY);			
		break;
	}
}

if(input_check_released("down"))
{

	mapX =	objMapManager.playerLastX;
	mapY = objMapManager.playerLastY;
	MoveToNewLocation(floor(mapX), mapY);
	//UpdateLastLocation();
	//MoveDown(objMapManager.mapData);
}
