/// @description Insert description here
// You can write your code in this editor
if(room == rmMenu)
{
	if(strum and !audio_is_playing(strum))
	{
		strum = noone;
		audio_set_master_gain(0, 0.5);
		curMusic = audio_play_sound(menuMusic, 10, true);
	}
}