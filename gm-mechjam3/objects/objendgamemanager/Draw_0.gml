/// @description Insert description here
// You can write your code in this editor
if(isActive)
{
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(0, 0, "HELP");
	draw_text(room_width/2, 50, "The battle was long and grueling, but in the end");
	draw_text(room_width/2, 70, "the emperor's last champion, "+rivalName+",");
	if(playerWon)
	{
		draw_text(room_width/2, 90, "was killed by a rebel pilot, ending the empire!");
		draw_text(room_width/2, 120, "YOU WIN!");
	}
	else
	{
		draw_text(room_width/2, 90, "killed the rebel pilot, ending the rebellion.");
		draw_text(room_width/2, 120, "YOU LOSE");
	}
}

draw_text(room_width/2, 250, "Press Enter/A to Restart");