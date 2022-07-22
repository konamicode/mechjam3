draw_healthbar(5, 5, 200 + (maxHp - 100), 10, (hp/maxHp) * 100, c_gray, c_red, c_green, 0, true, true);
draw_healthbar(5, 12, 200 + (maxStamina - 50), 17, (stamina/maxStamina) * 100, c_gray, c_blue, c_blue, 0, true, true);
for ( var i = 0; i < ds_list_size(subweapons); i++)
{
	draw_sprite_ext(sprIcons_subweapons, i, 16 + (i * ((sprite_get_width(sprIcons_subweapons)/2) + 3)), 28,
		0.5, 0.5, 0, c_white, 1);
	if (subweaponIdx == i) {
		draw_sprite_ext(sprIcons_subweapon_selected, i, 16 + (i * ((sprite_get_width(sprIcons_subweapon_selected)/2) + 3)), 28,
	0.5, 0.5, 0, c_white, 1);
	}
}

//draw_healthbar(5, 15, 205, 25, (energy/maxEnergy) * 100, c_gray, c_fuchsia, c_aqua, 0, true, true);


