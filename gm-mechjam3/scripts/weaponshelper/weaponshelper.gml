function Weapon(_label = "Name", _attackObj = objAttack, _baseDmg = 1, _enCost = 1, _fireRate = 10) constructor {
	energyCost = _enCost;
	baseDamage = _baseDmg;
	attack = _attackObj;
	fireRate = _fireRate;
	label = _label;
}

function BuildWeapons(weaponData = "none") {
	//are we loading weapon data from a spreadsheet or json? 
	if (weaponData != "none") {
		
	} else {
		Beam = new Weapon("beam", objBeam);
		Vulcan = new Weapon("bullet", objBullet);
		Melee = new Weapon("melee");
		Rocket = new Weapon("rocket", objRocket);
	//	Missile = new Weapon("missile", objMissile);
	}
		
}


function FireWeapon(_x, _y, _object ) {
	
	instance_create_layer(_x, _y, "Instances", _object);
		
}