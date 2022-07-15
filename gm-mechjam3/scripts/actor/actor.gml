// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum enmWeaponType {
	bullet,
	beam,
	beamDrone,
	melee,
	rocket,
	missile
	
}

function RefillEnergy() {
	energy = maxEnergy;
}


function RefillHP() {
	hp = maxHP;
}


function FireWeapon(_x, _y, _object ) {
	
	instance_create_layer(_x, _y, "Instances", _object);
		
}



