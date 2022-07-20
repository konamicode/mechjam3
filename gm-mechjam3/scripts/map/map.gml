// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function mapTileData() constructor {
	isLiberated = false;
	buff = enmBuffTypes.HP;
	bonus = noone;
	isPresent = true;
	isFinalBattle = false;
}

function AttemptToSpawnFinalBattle()
{
	var map = objMapManager.mapData;
	//Make sure we have a rival to fight
	if(ds_map_size(objCombatManager.rivalMap) == 0)
	{
		return;
	}
	
	//Determine if the final battle has been spawned already
	var finalTileExists = false;
	var liberationCount = 0;
	var absentCount = 0;
	var liberationRatio = 0.5;
	
	availablePositions = ds_list_create();
	for(i = 0; i < objMapManager.height; i++)
	{
		for(j = 0; j < objMapManager.width; j++)
		{
			if(map[i][j].isFinalBattle)
			{
				finalTileExists = true;
				break;
			}
			if(map[i][j].isLiberated)
			{
				liberationCount = liberationCount + 1;
			}
			else
			{
				if(map[i][j].isPresent)
				{
					ds_list_add(availablePositions, new Vector2(i, j));
				}
				else
				{
					absentCount = absentCount + 1;
				}
			}
		}
	}
	if(finalTileExists == true)
	{
		ds_list_destroy(availablePositions);
		return;
	}
	
	//If we've liberated enough of the map, place the boss fight tile
	var tiles = (objMapManager.height * objMapManager.width) - absentCount;
	if(liberationCount/tiles >= liberationRatio)
	{
		var finalPosition = ds_list_find_value(availablePositions, irandom(ds_list_size(availablePositions)-1));
		ds_list_destroy(availablePositions);
		map[finalPosition.x][finalPosition.y].isFinalBattle = true;
	}
}