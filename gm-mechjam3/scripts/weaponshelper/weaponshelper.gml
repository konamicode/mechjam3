

function Weapon(_label = "Name", _attackObj = objAttack, _baseDmg = 1, _enCost = 1, _fireRate = 10, _type = weaponType.ranged, _animSet = _animSet, _position = "weapon", _clipSize = 1, _burstRate = 0, _range = {minDist: 0, maxDist: 200}) constructor {
	cost = _enCost;
	baseDamage = _baseDmg;
	attack = _attackObj;
	fireRate = _fireRate;
	range = _range;
	label = _label;
	type = _type;
	animSet = _animSet;
	position = _position;
	clipSize = _clipSize;
	burstRate = _burstRate;
}

function LoadWeapons(weaponData = "none") {
	//are we loading weapon data from a spreadsheet or json? 
	var weaponMap = ds_map_create();
	if (weaponData != "none") {
		var weaponFile = file_text_open_read(weaponData);
		
		var jsonStr = "";
		while(!file_text_eof(weaponFile))
		{
			jsonStr += file_text_read_string(weaponFile);
			file_text_readln(weaponFile);
		}
		file_text_close(weaponFile);
		
		var jsonData =  json_parse(jsonStr);
		for (var i = 0; i < array_length(jsonData); i++)
		{
			var struct = jsonData[i];
			var _weapon =  new Weapon(struct.label, struct.attack, struct.baseDmg, struct.cost, struct.fireRate, struct.type, struct.animSet, struct.position, struct.clipSize, struct.burstRate);
			weaponMap[? struct.label] = _weapon;
		
		}

	} else {
		Beam = new Weapon("beam", objBeam);
		Beam.range = {minDist: 100, maxDist: screenWidth};
		weaponMap[? "beamRifle"] =  Beam;
		
		Vulcan = new Weapon("bullet", objBullet, 5, 2, 0.2, weaponType.ranged, {minDist:0, maxDist: 250});
		weaponMap[? "vulcan"] = Vulcan;
		Melee = new Weapon("melee", noone, 10, 10, 1.5, weaponType.melee, {minDist: 0, maxDist: 100});
		Rocket = new Weapon("rocket", objRocket);
		weaponMap[? "rocket"] = Rocket;
		Rocket.range = {minDist: 100, maxDist: 500}
		weaponMap[? "melee"] = Melee;
		
	//	Missile = new Weapon("missile", objMissile);
	}
	if ( ds_map_size(weaponMap) > 0)
		return weaponMap;
	else
		ds_map_destroy(weaponMap);
		return undefined;
}

