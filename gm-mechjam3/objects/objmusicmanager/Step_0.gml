/// @description Insert description here
// You can write your code in this editor
if(room == rmMenu)
{
	if(strum and !audio_is_playing(strum))
	{
		strum = noone;
		curMusic = audio_play_sound(menuMusic, 10, true);
	}
}

if(curRoom != room)
{
	audio_stop_sound(curMusic);
	curRoom = room;
	
	//switch(room)
	//{
	//	case rmCombat:
	//	{
	//		curMusic = audio_play_sound(battleMusic, 10, true);
	//		break;
	//	}
	//	case rmMap:
	//	{
	//		curMusic = audio_play_sound(mapMusic, 10, true);
	//		break;
	//	}
	//	case rmMenu:
	//	{
	//		curMusic = audio_play_sound(menuMusic, 10, true);
	//		break;
	//	}
	//}
}