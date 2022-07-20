// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlaySoundByTag(_tag) {
	var _sound = -1;
	switch(_tag) 
	{
		case "melee": 
		{
			_sound = choose(sndMelee01, sndMelee02);			
		}
		break;
		case "beamRifle":
		{
			_sound = choose(sndLaser01, sndLaser02);
			
		}
		break;
		case "explosion":
			_sound = choose(sndExplosion01, sndExplosion02);
		break;
		
	}
	if _sound != -1
		audio_play_sound(_sound, 1, false);
	
}

if (!ds_map_exists(global.functionMap, PlaySoundByTag))
	global.functionMap[? "PlaySoundByTag"] = method(undefined, PlaySoundByTag);	