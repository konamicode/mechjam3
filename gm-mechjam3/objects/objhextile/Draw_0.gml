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
		
		//Buff icon
		switch(buff)
		{
			case enmBuffTypes.HP:
			{
				draw_sprite(sprBuffHP, image_index, x, y);
				break;
			}
			case enmBuffTypes.Stamina:
			{
				draw_sprite(sprBuffStamina, image_index, x, y);
				break;
			}
			case enmBuffTypes.Speed:
			{
				draw_sprite(sprBuffSpeed, image_index, x, y);
				break;
			}
			case enmBuffTypes.MeleePower:
			{
				draw_sprite(sprBuffMeleeDmg, image_index, x, y);
				break;
			}
			case enmBuffTypes.RangedPower:
			{
				draw_sprite(sprBuffRangedDmg, image_index, x, y);
				break;
			}
		}
	}
}

