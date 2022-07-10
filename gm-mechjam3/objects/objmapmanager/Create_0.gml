/// @description Generate the map manager
width = 9;
height = 6;

minDensity = 0.7;
maxDensity = 0.9;

map = [];

function GenerateMap()
{
	//Initialize the tile array
	for(i = 0; i < height; i++)
	{
		map[i] = [width];
	}
	
	for(j = 0; j < height; j++)
	{
		for(k = 0; k < width; k++)
		{
			map[j][k] = new mapTileData();
		}
	}
	
	//Give the player a starting location
	map[irandom(height-1)][irandom(width-1)].isLiberated = true;
	
	//Determine exclusion portion
	var exclusionCount = floor((width * height) - (random_range(minDensity, maxDensity) * width * height));
	
	while(exclusionCount > 0)
	{
		var xLoc = irandom(height-1);
		var yLoc = irandom(width-1);
		
		if(map[xLoc][yLoc].isLiberated == false and map[xLoc][yLoc].isPresent == true)
		{
			map[xLoc][yLoc].isPresent = false;
			exclusionCount = exclusionCount - 1;
		}
	}
}

function DisplayMap()
{
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
			
			
			var newTile = instance_create_layer(xLoc, yLoc, "Map", objHexTile);
			newTile.isLiberated = map[i][j].isLiberated;
			newTile.buff = map[i][j].buff;
			newTile.bonus = map[i][j].bonus;
			newTile.isPresent = map[i][j].isPresent;
		}
	}
}