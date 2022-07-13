// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function PlayerData() constructor {
	subWeapons = [];
	
	meleeAttackPower = 10;
	rngAttackPower = 10;
	maxHP = 100;
	maxStamina = 50;
	moveSpeed = 6.0;
	
	buffLevel = 0;
	
	function AddSubWeapon(subWeaponData) {
		subWeapons[array_length(subWeapons)] = subWeaponData;
	}
	
	function UpgradePlayer(stat)
	{
		switch(stat)
		{
			case enmBuffTypes.HP:
			{
				maxHP = floor(maxHP * 1.1);
				break;
			}
			case enmBuffTypes.Speed:
			{
				moveSpeed = moveSpeed * 1.05;
				break;
			}
			case enmBuffTypes.Stamina:
			{
				maxStamina = floor(maxStamina * 1.1);
				break;
			}
			case enmBuffTypes.MeleePower:
			{
				meleeAttackPower = floor(meleeAttackPower * 1.1);
				break;
			}
			case enmBuffTypes.RangedPower:
			{
				rngAttackPower = floor(rngAttackPower * 1.1);
				break;
			}
		}
		buffLevel = buffLevel + 1;
	}
	
}


function EnemyData() constructor {
	name = "";
	level = 1;
	meleeWeaponLvl = 1;
	rngWeaponLvl = 1;
}

function GameData() constructor {
	map = [];
	player = new PlayerData();
	rivals = [];
}

