function Weapon(_attackObj = objAttack, _baseDmg = 1, _enCost = 1, _fireRate = 10) constructor {
	energyCost = _enCost;
	baseDamage = _baseDmg;
	attack = _attackObj;
	fireRate = _fireRate;
}

function BuildWeapons(weaponData = "none") {
	//are we loading weapon data from a spreadsheet or json? 
	if (weaponData != "none") {
		
	} else {
		Beam = new Weapon(objBeam);
		Vulcan = new Weapon(objBullet);
		Melee = new Weapon();
		Rocket = new Weapon(objRocket);
		Missile = new Weapon(objMissile);
	}
		
}


function FireWeapon(_x, _y, _object ) {
	
	instance_create_layer(_x, _y, "Instances", _object);
		
}