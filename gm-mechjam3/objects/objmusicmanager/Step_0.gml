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
	
	switch(room)
	{
		case rmCombat:
		{
			curMusic = battleMusic;
			break;
		}
		case rmMap:
		{
			curMusic = mapMusic;
			break;
		}
		case rmMenu:
		{
			curMusic = menuMusic;
			break;
		}
	}
	audio_play_sound(curMusic, 10, true);
}