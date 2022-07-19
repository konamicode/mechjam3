/// @description Insert description here
// You can write your code in this editor
strum = audio_play_sound(introStrum, 10, false);
curMusic = noone;
curRoom = room;

function StopMusic()
{
	audio_stop_sound(curMusic);
}

function RivalArrival()
{
	audio_stop_sound(curMusic);
	curMusic = audio_play_sound(rivalMusic, 10, true);
}