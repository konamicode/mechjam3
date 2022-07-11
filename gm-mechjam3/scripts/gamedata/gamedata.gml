// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function PlayerData() constructor {
	subWeapons = [];
	meleeWeaponLvl = 1;
	rngWeaponLvl = 1;
	
	function AddSubWeapon(subWeaponData) {
		subWeapons[array_length(subWeapons)] = subWeaponData;
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

