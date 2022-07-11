/// @description Generate the map manager
width = 9;
height = 6;

minDensity = 0.7;
maxDensity = 0.9;

mapData = [];
tileMap = [];

playerStartX = 0;
playerStartY = 0;

function GenerateMap()
{
	//Initialize the tile data array
	for(i = 0; i < height; i++)
	{
		mapData[i] = [width];
	}
	
	for(j = 0; j < height; j++)
	{
		for(k = 0; k < width; k++)
		{
			mapData[j][k] = new mapTileData();
		}
	}
	
	//Give the player a starting location
	playerStartX = irandom(width-1);
	playerStartY = irandom(height-1);
	mapData[playerStartY][playerStartX].isLiberated = true;
	
	//Determine exclusion portion
	var exclusionCount = floor((width * height) - (random_range(minDensity, maxDensity) * width * height));
	
	while(exclusionCount > 0)
	{
		var xLoc = irandom(height-1);
		var yLoc = irandom(width-1);
		
		if(mapData[xLoc][yLoc].isLiberated == false and mapData[xLoc][yLoc].isPresent == true)
		{
			mapData[xLoc][yLoc].isPresent = false;
			exclusionCount = exclusionCount - 1;
		}
	}
}

function DisplayMap()
{
	//Initialize the tile array
	for(t = 0; t < height; t++)
	{
		tileMap[t] = [width];
	}
	
	for(i = 0; i < height; i++)
	{
		for(j = 0; j < width; j++)
		{
			var xLoc = (j * (sprite_get_width(sprHexTile))) + sprite_get_width(sprHexTile);
			if(i mod 2 == 0)
			{
				xLoc = xLoc + sprite_get_width(sprHexTile)/2;
			}
			xLoc = xLoc - sprite_get_width(sprHexTile)/4;
			
			var yLoc = ((i * sprite_get_height(sprHexTile)) - i * (sprite_get_height(sprHexTile))/4) + sprite_get_height(sprHexTile);
					
			tileMap[i][j] = instance_create_layer(xLoc, yLoc, "Map", objHexTile);
			tileMap[i][j].isLiberated = mapData[i][j].isLiberated;
			tileMap[i][j].buff = mapData[i][j].buff;
			tileMap[i][j].bonus = mapData[i][j].bonus;
			tileMap[i][j].isPresent = mapData[i][j].isPresent;
		}
	}
	
	
	var player = instance_create_layer(tileMap[playerStartY][playerStartX].x, tileMap[playerStartY][playerStartX].y, "Pawns", objPlayerPawn);
	player.mapX = playerStartX;
	player.mapY = playerStartY;
}