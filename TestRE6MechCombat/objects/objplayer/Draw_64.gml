

draw_healthbar(5, 5, 205, 15, (hp/maxHP) * 100, c_gray, c_red, c_green, 0, true, true);

draw_healthbar(5, 20, 205, 30, (energy/maxEnergy) * 100, c_gray, c_fuchsia, c_aqua, 0, true, true);

if aiming
	draw_text(5, 30, "Aiming");
	
	
	
draw_text(30, room_height - 90, "aim: hold rmb/l trigger");
draw_text(30, room_height - 60, "attack: lmb/r shoulder button");
draw_text(30, room_height - 30, "quickshot: aim + attack");