/// @description Insert description here
// You can write your code in this editor
if(isActive)
{
	draw_set_color(c_white);
	switch(page)
	{
		case 0:
		{
			draw_set_halign(fa_center);
			draw_text(room_width/2, 20, "Rivals in the Sky");
			
			draw_set_halign(fa_left);		
			draw_text(20, 50, "Liberate the sector, hex by hex, from the forces of the emperor.");
			draw_text(20, 70, "Green hexes have been liberated. Red hexes are still conquered.");
			draw_text(20, 90, "Icons on red hexes show the buff you get for liberating them.");
			draw_text(20, 110, "Fight enemy mech pilots, but beware: Some may take it personally.");
			draw_text(20, 130, "When a black hex appears, it is here the final battle awaits.");
			draw_text(20, 150, "This fight to the death with your greatest rival will decide");
			draw_text(20, 170, "the fate of the sector once and for all!");
			break;
		}
		case 1:
		{
			draw_set_halign(fa_center);
			draw_text(room_width/2, 20, "Map Controls");
			
			draw_set_halign(fa_left);		
			draw_text(20, 50, "Use left and right on the dpad, A and D or the left and right");
			draw_text(20, 70, "arrow keys to aim your movement on the hex grid. You can move");
			draw_text(20, 90, "freely in liberated spaces, but cannot move through a conquered");
			draw_text(20, 110, "tile. Press up on the dpad, W, or the up arrow key to move in");
			draw_text(20, 130, "the direction you've selected. Press Start or Enter on a");
			draw_text(20, 150, "conquered tile to attempt to liberate it.");
			break;
		}
		case 2:
		{
			draw_set_halign(fa_center);
			draw_text(room_width/2, 20, "Combat Controls");
			
			draw_set_halign(fa_left);		
			draw_text(20, 50, "Move with the dpad, left stick, WASD, or the arrow keys. Shoot");
			draw_text(20, 70, "with RT or the left mouse button. Use your beam sabre with RB or");
			draw_text(20, 90, "Space Bar. Scroll through your subweapons with X and B or the");
			draw_text(20, 110, "mouse wheel, and fire it with LB or F. Aim your main attack by");
			draw_text(20, 130, "holding LT or the right mouse button.");
			break;
		}
	}
	draw_set_halign(fa_center);
	draw_text(room_width/2, 340, "Page "+string(page+1)+"/"+string(pageCount));
}