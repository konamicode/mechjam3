/// @description Insert description here
// You can write your code in this editor
if(isPresent)
{
	if(isLiberated)
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_green, 1);
	}
	else
	{
		draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_red, 1);
	}
}