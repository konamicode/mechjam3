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
		if(isFinalBattle)
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_black, 1);
			draw_sprite(sprBossIcon, image_index, x, y);
		}
		else
		{
			draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_red, 1);
			
			//Buff icon
			var _buffSprite = noone;
			switch(buff)
			{
				case enmBuffTypes.HP:
				{
					_buffSprite = sprBuffHP;
					break;
				}
				case enmBuffTypes.Stamina:
				{
					_buffSprite = sprBuffStamina;
					break;
				}
				case enmBuffTypes.Speed:
				{
					_buffSprite = sprBuffSpeed;
					break;
				}
				case enmBuffTypes.MeleePower:
				{
					_buffSprite = sprBuffMeleeDmg;
					break;
				}
				case enmBuffTypes.RangedPower:
				{
					_buffSprite = sprBuffRangedDmg;
					break;
				}
			}
			draw_sprite(_buffSprite, image_index, x, y);
		}
	}
}

