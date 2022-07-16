

function Weapon(_label = "Name", _attackObj = objAttack, _baseDmg = 1, _enCost = 1, _fireRate = 10, _range = {minDist: 0, maxDist: 200}) constructor {
	energyCost = _enCost;
	baseDamage = _baseDmg;
	attack = _attackObj;
	fireRate = _fireRate;
	range = _range;
	label = _label;
}

function BuildWeapons(weaponData = "none") {
	//are we loading weapon data from a spreadsheet or json? 
	if (weaponData != "none") {
		
	} else {
		Beam = new Weapon("beam", objBeam);
		Beam.range = {minDist: 100, maxDist: screenWidth};
		Vulcan = new Weapon("bullet", objBullet, 5, 2, 0.2, {minDist:0, maxDist: 250});
		Melee = new Weapon("melee");
		Rocket = new Weapon("rocket", objRocket);
		Rocket.range = {minDist: 100, maxDist: 500}
	//	Missile = new Weapon("missile", objMissile);
	}
		
}


function FireWeapon(_x, _y, _object ) {
	
	instance_create_layer(_x, _y, "Instances", _object);
		
}